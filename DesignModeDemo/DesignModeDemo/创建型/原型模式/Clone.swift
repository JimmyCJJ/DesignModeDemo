//
//  Clone.swift
//  DesignModeDemo
//
//  Created by caojianjin on 2023/5/23.
//

import Foundation

protocol copyable: AnyObject {
    func copy() -> AnyObject
    func multableCopy() -> AnyObject
}

class Person: copyable {
    let age: Int
    let weight: Int
    let son: Person?
    
    init(age: Int, weight: Int, son: Person?) {
        self.age = age
        self.weight = weight
        self.son = son
    }
    
    func copy() -> AnyObject {
        let result = Person(age: age, weight: weight, son: son)
        return result;
    }
    
    func multableCopy() -> AnyObject {
        var son: Person?
        if (self.son != nil) {
            son = Person(age: self.son!.age, weight: self.son!.weight, son: self.son!.son)
        }
        let result = Person(age: age, weight: weight, son: son)
        return result
    }
}


