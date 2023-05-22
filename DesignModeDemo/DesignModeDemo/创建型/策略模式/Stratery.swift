//
//  Stratery.swift
//  DesignModeDemo
//
//  Created by 曹鉴津 on 2023/5/22.
//

import Foundation

protocol Comparetor {
    func canUse() -> Bool
    func compare()
}

class comparetorA: Comparetor {
    func canUse() -> Bool {
        return false
    }
    func compare() {
        print("比较器A-顺序")
    }
}

class comparetorB: Comparetor {
    func canUse() -> Bool {
        return true
    }
    func compare() {
        print("比较器B-倒序")
    }
}

class comparetor

class strateryController {
    var arr: Array<Comparetor>
    init() {
        let a: Comparetor = comparetorA()
        let b: Comparetor = comparetorB()
        arr = [a, b]
    }
    func request() -> Comparetor? {
        var result: Comparetor?
        for com in arr {
            if (com.canUse()) {
                result = com
                break
            }
        }
        return result
    }
}


