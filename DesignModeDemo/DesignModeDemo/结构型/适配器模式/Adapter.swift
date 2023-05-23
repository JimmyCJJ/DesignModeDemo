//
//  Adapter.swift
//  DesignModeDemo
//
//  Created by caojianjin on 2023/5/23.
//

import Foundation

protocol targetInterface {
    func getResult() -> String
}

class sourceObject {
    let age: Int
    let weight: Int
    
    init(age: Int, weight: Int) {
        self.age = age
        self.weight = weight
    }
    
    func getResult() -> Int {
        return age + weight
    }
}

class adapterObject: targetInterface {
    var sourceObj: sourceObject?
    init(_ source: sourceObject) {
        sourceObj = source
    }
    func getResult() -> String {
        if (sourceObj == nil) {
            return "error"
        }
        return String(format: "年龄%d-体重%d", sourceObj!.age, sourceObj!.weight)
    }
}
