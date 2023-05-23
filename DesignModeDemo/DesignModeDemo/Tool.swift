//
//  Tool.swift
//  DesignModeDemo
//
//  Created by caojianjin on 2023/5/23.
//

import Foundation

public func printSelf(_ object: AnyObject?) {
    if (object == nil) {
        print("对象为空")
    }
    print("地址为: \(Unmanaged<AnyObject>.passUnretained(object!).toOpaque())")
}
