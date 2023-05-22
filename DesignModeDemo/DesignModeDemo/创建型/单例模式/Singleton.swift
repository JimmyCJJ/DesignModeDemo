//
//  Singleton.swift
//  DesignModeDemo
//
//  Created by 曹鉴津 on 2023/5/22.
//

import Foundation

extension DispatchQueue {
    private static var _onceTracker = [String]()
    class func once(_ token: String, block:()->Void) {
        objc_sync_enter(self)
        defer {objc_sync_exit(self)}
        
        if (_onceTracker.contains(token)) {
            return
        }
        _onceTracker.append(token)
        block()
    }
}

class MusicSingleton {
    // 方式1、采用static的类属性实现单例模式，这种类属性只被延迟加载执行一次，即便是在多线程情况下也只是执行一次，并且保证是线程安全的
    static let sharedSingleton = MusicSingleton()
    // 方式2、与类不同，结构可以定义静态变量，通过使用此方法，将静态变量升级为类变量(在支持类变量之前，推荐此方法)
//    class var sharedSingleton: MusicSingleton {
//        struct single {
//            static let sharedSingleton = MusicSingleton()
//        }
//        return single.sharedSingleton
//    }
    // 方式3、实现类似oc的dispatch_once函数
//    class var sharedSingleton: MusicSingleton {
//        struct single {
//            static var OnceToken = NSUUID().uuidString //自定义唯一值
//            static var instance = MusicSingleton()
//        }
//        DispatchQueue.once(single.OnceToken) {
//            single.instance = MusicSingleton()
//        }
//        return single.instance
//    }
    
    // 私有化默认构造函数，防止外界创建新的实例
    private init() {}
    
    var musicNum = 1
    var isPlaying = false
    func printNum() {
        print("print--\(musicNum)-\(printSelf())")
    }
    func play() {
        print("开始播放\(printSelf())")
        isPlaying = true
        DispatchQueue.global(qos: .background).async {
            while self.isPlaying {
                print("正在播放\(self.printSelf())")
                sleep(1)
            }
        }
    }
    func pause() {
        print("暂停播放\(printSelf())")
        isPlaying = false
    }
    
    private func printSelf() {
        print("地址为: \(Unmanaged<AnyObject>.passUnretained(self).toOpaque())")
    }
}
