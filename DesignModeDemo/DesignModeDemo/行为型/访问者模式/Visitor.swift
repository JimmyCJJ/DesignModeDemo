//
//  Visitor.swift
//  DesignModeDemo
//
//  Created by caojianjin on 2023/6/1.
//

import Foundation

protocol PhoneUpdate {
    func updateCamera(_ camera: Camera)
    func updateTheme(_ theme: Theme)
    func updateMessage(_ message: Message)
}

class PhoneUpdateV1: PhoneUpdate {
    func updateCamera(_ camera: Camera) {
        camera.version = "1";
    }
    
    func updateTheme(_ theme: Theme) {
        theme.version = "1";
    }
    
    func updateMessage(_ message: Message) {
        message.version = "1";
    }
}

protocol PhoneSoftWare {
    var version: String {get set}
    func printVersion()
    func accept(_ update: PhoneUpdate)
}

class Phone {
    private let camera = Camera()
    private let theme = Theme()
    private let message = Message()
    
    func printPhoneSoftWareInfo() {
        camera.printVersion()
        theme.printVersion()
        message.printVersion()
    }
    
    func accept(_ update: PhoneUpdate) {
        camera.accept(update)
        theme.accept(update)
        message.accept(update)
    }
}

class Camera: PhoneSoftWare {
    var version: String = "0"
    func printVersion() {
        print("相机APP当前版本：\(version)")
    }
    func accept(_ update: PhoneUpdate) {
        update.updateCamera(self)
    }
}

class Theme: PhoneSoftWare {
    var version: String = "0"
    func printVersion() {
        print("主题APP当前版本：\(version)")
    }
    func accept(_ update: PhoneUpdate) {
        update.updateTheme(self)
    }
}

class Message: PhoneSoftWare {
    var version: String = "0"
    func printVersion() {
        print("信息APP当前版本：\(version)")
    }
    func accept(_ update: PhoneUpdate) {
        update.updateMessage(self)
    }
}
