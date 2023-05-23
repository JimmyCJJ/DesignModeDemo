//
//  Appearance.swift
//  DesignModeDemo
//
//  Created by 曹鉴津 on 2023/5/24.
//

import Foundation

class Investment {
    func buyStockOne() {
        print("投资股票1")
    }
    func buyStockTwo() {
        print("投资股票2")
    }
    func buyHouse() {
        print("投资房地产")
    }
    func sellStockOne() {
        print("卖出股票1")
    }
    func sellStockTwo() {
        print("卖出股票2")
    }
    func sellHouse() {
        print("卖出房地产")
    }
}

class fundAppearance {
    let investment = Investment()
    func buy() {
        investment.buyStockOne()
        investment.buyStockTwo()
        investment.buyHouse()
    }
    func sell() {
        investment.sellStockOne()
        investment.sellStockTwo()
        investment.sellHouse()
    }
}
