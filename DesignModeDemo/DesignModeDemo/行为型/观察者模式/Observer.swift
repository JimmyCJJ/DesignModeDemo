//
//  Observer.swift
//  DesignModeDemo
//
//  Created by 曹鉴津 on 2023/5/26.
//

import Foundation

enum SonStatus: String {
    case happy = "开心"
    case sad = "伤心"
    case smile = "笑"
}

protocol KVOProtocol {
    func update(_ oldValue: Any, _ newValue: Any)
}

extension KVOProtocol {
    func update(_ oldValue: Any, _ newValue: Any) {
        
    }
}

class Son: KVOProtocol {
    var observers = [AnyObject & KVOProtocol]()
    var status = SonStatus.happy
    func addObserver(_ obj: AnyObject & KVOProtocol) {
        observers.append(obj)
    }
    func removeObserver(_ obj: AnyObject & KVOProtocol) {
        guard let index = observers.firstIndex(where: {$0 === obj}) else { return }
        observers.remove(at: index)
    }
    func changeStatus(_ status: SonStatus) {
        let oldStatus = self.status
        self.status = status
        updateObservers(oldStatus, status)
    }
    func updateObservers(_ oldValue: Any, _ newValue: Any) {
        for obj in observers {
            obj.update(oldValue, newValue)
        }
    }
}

class Father: KVOProtocol {
    func update(_ oldValue: Any, _ newValue: Any) {
        print("\(self)收到了通知：\(oldValue)->\(newValue)");
    }
}

class Mother: KVOProtocol {
    func update(_ oldValue: Any, _ newValue: Any) {
        print("\(self)收到了通知：\(oldValue)->\(newValue)");
    }
}

protocol BookPlatform {
    var subscribes: [Subscribe] {get set}
    func registerSubscribe(_ subscribe: Subscribe)
    func post(_ msg: String)
}

protocol Publish {
    func postMessage(_ platform: BookPlatform, _ msg: String)
}

protocol Subscribe {
    func onEvent(_ msg: String)
}

class Publisher: Publish {
    func postMessage(_ platform: BookPlatform, _ msg: String) {
        platform.post(msg)
    }
}

class Subscriber: Subscribe {
    func onEvent(_ msg: String) {
        printSelf(self)
        print("收到了消息：\(msg)")
    }
}

class BookPlatformer: BookPlatform {
    var subscribes: [Subscribe] = [Subscribe]()
    func registerSubscribe(_ subscribe: Subscribe) {
        subscribes.append(subscribe)
    }
    func post(_ msg: String) {
        for subscribe in subscribes {
            subscribe.onEvent(msg)
        }
    }
}
