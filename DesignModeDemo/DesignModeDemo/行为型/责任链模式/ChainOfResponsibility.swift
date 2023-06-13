//
//  ChainOfResponsibility.swift
//  DesignModeDemo
//
//  Created by caojianjin on 2023/6/1.
//

import Foundation

class ChainError: LocalizedError {
    var desc: String?
    init(_ desc: String) {
        self.desc = desc
    }
    
    var errorDescription: String? {
        return desc
    }

    var failureReason: String? {
        return ""
    }

    var recoverySuggestion: String? {
        return ""
    }

    var helpAnchor: String? {
        return ""
    }
}

protocol Intercept {
    func intercept<T>(_ params: T, _ chainHandler: ChainHandler)
}

class Intercept1: Intercept {
    func intercept<T>(_ params: T, _ chainHandler: ChainHandler) {
        print("\(params)->Intercept1")
        let success = true
        if (success) {
            chainHandler.excute()
        } else {
            chainHandler.completion(nil, ChainError("Intercept1失败"))
        }
    }
}

class Intercept2: Intercept {
    func intercept<T>(_ params: T, _ chainHandler: ChainHandler) {
        print("\(params)->Intercept2")
        let success = true
        if (success) {
            chainHandler.excute()
        } else {
            chainHandler.completion(nil, ChainError("Intercept2失败"))
        }
    }
}

class ChainHandlerParams {
    var string : String?
}

class ChainHandler {
    var currentIndex = -1
    var interceptArray = [Intercept]()
    var params: ChainHandlerParams?
    func setParams(_ params: ChainHandlerParams?) -> ChainHandler {
        self.params = params
        return self
    }
    func add(_ intercept: Intercept) -> ChainHandler {
        for cur in interceptArray {
            if (type(of: cur) == type(of: intercept)) {
                return self
            }
        }
        interceptArray.append(intercept)
        return self
    }
    func remove(_ intercept: Intercept) -> ChainHandler {
        interceptArray.removeAll(where: {
            type(of: $0) == type(of: intercept)
        });
        return self
    }
    func excute() {
        if (interceptArray.count > 0 && currentIndex < interceptArray.count - 1) {
            currentIndex += 1
            interceptArray[currentIndex].intercept(params, self)
        } else {
            completion(nil, nil)
        }
    }
    func completion(_ response: AnyObject?, _ error: ChainError?) {
        print("结束---response:\(printSelf(response))---error=\(String(describing: error?.errorDescription))")
    }
}
