//
//  Combination.swift
//  DesignModeDemo
//
//  Created by caojianjin on 2023/5/24.
//

import Foundation

class WashClothesMachine {
    func wash() {
        print("洗衣机-洗衣服")
    }
}

class WashDishedMachine {
    func wash() {
        print("洗碗机-洗碗")
    }
}

class SweepMachine {
    func sweep() {
        print("扫地机器人-扫地")
    }
}

class People {
    private let washClothesMachine = WashClothesMachine()
    private let washDishedMachine = WashDishedMachine()
    private let sweepMachine = SweepMachine()
    
    func washClothes() {
        washClothesMachine.wash()
    }
    func washDishes() {
        washDishedMachine.wash()
    }
    func sweep() {
        sweepMachine.sweep()
    }
}
