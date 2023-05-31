//
//  Iterator.swift
//  DesignModeDemo
//
//  Created by caojianjin on 2023/5/31.
//

import Foundation

protocol InteratorProtocol {
    func hasNext() -> Bool
    func next() -> Any
    func resetNext()
}

class OneArray: InteratorProtocol {
    var array: Array<Any>
    private var nextIndex = -1
    init(array: Array<Any>) {
        self.array = array
    }
    internal func hasNext() -> Bool {
        return array.count > nextIndex + 1
    }
    internal func next() -> Any {
        nextIndex += 1
        return array[nextIndex]
    }
    func resetNext() {
        nextIndex = -1
    }
}

class OneDictionary: InteratorProtocol {
    var dictionary: Dictionary<String, Any>
    private var nextIndex = -1
    private var curKey: Dictionary<String, Any>.Index
    init(dictionary: Dictionary<String, Any>) {
        self.dictionary = dictionary
        curKey = dictionary.startIndex
    }
    internal func hasNext() -> Bool {
        return dictionary.keys.count > nextIndex + 1
    }
    internal func next() -> Any {
        let value = dictionary[curKey]
        curKey = dictionary.keys.index(after: curKey)
        nextIndex += 1
        return value
    }
    func resetNext() {
        nextIndex = -1
    }
}

class Interator {
    class func traverse(_ container: InteratorProtocol, _ callback: (_ element: Any)->Void) {
        while (container.hasNext()) {
            callback(container.next())
        }
        container.resetNext()
    }
}
