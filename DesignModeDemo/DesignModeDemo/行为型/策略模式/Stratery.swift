//
//  Stratery.swift
//  DesignModeDemo
//
//  Created by 曹鉴津 on 2023/5/22.
//

import Foundation

enum ComparetorType {
    case A
    case B
}

protocol Comparetor {
    var model: ComparetorModel{get}
    func getResult() -> Int
    func canUse() -> Bool
    func compare()
}

class ComparetorModel {
    var priority: Int = 0
    init(_ value: Int) {
        priority = value
    }
}

class ComparetorA: Comparetor {
    let model: ComparetorModel = ComparetorModel(1)
    func getResult() -> Int {
        return 100
    }
    func canUse() -> Bool {
        return true
    }
    func compare() {
        print("比较器A-顺序")
    }
}

class ComparetorB: Comparetor {
    let model: ComparetorModel = ComparetorModel(2)
    func getResult() -> Int {
        return 200
    }
    func canUse() -> Bool {
        return true
    }
    func compare() {
        print("比较器B-倒序")
    }
}

class StrateryController {
    var com: Comparetor?
    func setComparetor(_ param: Comparetor) {
        com = param
    }
    func getResult() -> Int? {
        return com?.getResult()
    }
    
    init(_ type: ComparetorType) {
        if (type == ComparetorType.A) {
            com = ComparetorA()
        } else if (type == ComparetorType.B) {
            com = ComparetorB()
        }
    }
    
    init() {
        let a: Comparetor = ComparetorA()
        let b: Comparetor = ComparetorB()
        arr = [a, b]
    }
    
    var arr: Array<Comparetor>?
    func request() -> Comparetor? {
        // 先按照优先级排序
        var result: Comparetor?
        if (arr != nil) {
            arr!.sort { (item0, item1) -> Bool in
                return item0.model.priority > item1.model.priority
            }
            // 再决定哪个可以使用
            for com in arr! {
                if (com.canUse()) {
                    result = com
                    break
                }
            }
        }
        return result
    }
}


