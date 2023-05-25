//
//  TemplateMethod.swift
//  DesignModeDemo
//
//  Created by 曹鉴津 on 2023/5/26.
//

import Foundation

class PersonObj {
    func beginOneDay() {
        print("以下是我一天的行程")
        getUp()
        brush()
        beforeBreakfast()
        breakfast()
        launch()
        afternoon()
        dinner()
        sleep()
    }
    
    private func getUp() {
        print("起床")
    }
    
    private func brush() {
        print("刷牙")
    }
    
    fileprivate func beforeBreakfast() {
        fatalError("Must Override")
    }
    
    private func breakfast() {
        print("吃早餐")
    }
    
    fileprivate func launch() {
        fatalError("Must Override")
    }
    
    fileprivate func afternoon() {
        print("下午休息")
    }
    
    fileprivate func dinner() {
        fatalError("Must Override")
    }
    
    private func sleep() {
        print("睡觉")
    }
}

class Boy: PersonObj {
    override init() {
        print("我是男生")
    }
    
    override fileprivate func beforeBreakfast() {
        print("剃须")
    }
    
    override fileprivate func launch() {
        print("中午不吃了")
    }
    
    override fileprivate func dinner() {
        print("晚餐吃龙虾")
    }
}

class Girl: PersonObj {
    override init() {
        print("我是女生")
    }
    
    override fileprivate func beforeBreakfast() {
        print("化妆")
    }
    
    override fileprivate func launch() {
        print("中午叫外卖")
    }
    
    override fileprivate func afternoon() {
        print("下午做美容")
    }
    
    override fileprivate func dinner() {
        print("晚餐吃西餐")
    }
}
