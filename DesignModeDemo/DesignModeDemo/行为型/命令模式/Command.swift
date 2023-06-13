//
//  Command.swift
//  DesignModeDemo
//
//  Created by caojianjin on 2023/6/1.
//

import Foundation

protocol Command {
    func excute()
}

class Invoker {
    let command: Command
    init(_ command: Command) {
        self.command = command
    }
    func invoke() {
        command.excute()
    }
}

class WashClothesCommand: Command {
    func excute() {
        Receiver1().washClothes()
    }
}
class SweepCommand: Command {
    func excute() {
        Receiver2().sweep()
    }
}

class CleanCommand: Command {
    func excute() {
        Receiver3().clean()
    }
}


class Receiver1 {
    func washClothes() {
        print("洗衣服")
    }
}

class Receiver2 {
    func sweep() {
        print("扫地")
    }
}

class Receiver3 {
    func clean() {
        print("搞卫生")
    }
}
