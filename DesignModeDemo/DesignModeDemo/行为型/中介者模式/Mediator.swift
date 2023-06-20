//
//  Mediator.swift
//  DesignModeDemo
//
//  Created by caojianjin on 2023/6/1.
//

import Foundation

class Mediator {
    var arr = [String]()
    func register(_ module: String) {
        arr.append(module)
    }
    
    func routerToModule(_ module: String) {
        for m in arr {
            if (m == module) {
                print("跳转到\(module)")
            }
        }
    }
}

class UserModule {
    let mediator: Mediator
    init(_ mediator: Mediator) {
        self.mediator = mediator
        mediator.register("UserModule")
    }
}

class GoodsModule {
    let mediator: Mediator
    init(_ mediator: Mediator) {
        self.mediator = mediator
        mediator.register("GoodsModule")
    }
}

class ShopCarModule {
    let mediator: Mediator
    init(_ mediator: Mediator) {
        self.mediator = mediator
        mediator.register("ShopCarModule")
    }
}
