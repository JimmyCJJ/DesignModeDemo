//
//  Decorator.swift
//  DesignModeDemo
//
//  Created by caojianjin on 2023/5/23.
//

import Foundation

class Man {
    func run() {
        print("跑")
    }
}

class ManDecorator {
    let man: Man
    init(man: Man) {
        self.man = man
    }
    func run() {
        man.run()
    }
    func fly() {
        print("飞")
    }
}
