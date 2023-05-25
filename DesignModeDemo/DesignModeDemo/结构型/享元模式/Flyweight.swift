//
//  Flyweight.swift
//  DesignModeDemo
//
//  Created by caojianjin on 2023/5/24.
//

import Foundation

class StringManager {
    static let sharedManager = StringManager()
    var container: [String: StringObj] = [:]
    func getStringObj(_ str: String) -> StringObj? {
        return container[str]
    }
    func setStringObj(_ str: String, _ obj: StringObj) {
        container[str] = obj
    }
    private init() {
        
    }
}

class StringObj  {
    var str: String
    static func createObj(str: String) -> StringObj {
        let manager = StringManager.sharedManager
        var stringObj = manager.getStringObj(str)
        if (stringObj == nil) {
            stringObj = StringObj(str: str)
            manager.setStringObj(str, stringObj!)
        }
        return stringObj!
    }
    
    private init(str: String) {
        self.str = str
    }
}
