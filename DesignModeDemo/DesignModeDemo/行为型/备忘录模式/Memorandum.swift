//
//  Memorandum.swift
//  DesignModeDemo
//
//  Created by caojianjin on 2023/6/1.
//

import Foundation

class Originator {
    private var state: String = ""
    
    func setState(_ state: String) {
        self.state = state
    }
    
    func createMemento() -> Memento {
        return Memento(state: state)
    }
    
    func restoreMemento(_ memento: Memento) {
        state = memento.getState()
    }
    
    func printState() {
        print("当前状态是:\(state)")
    }
}

class Memento {
    private var state: String
    
    init(state: String) {
        self.state = state
    }
    
    func getState() -> String {
        return state
    }
}

class Caretaker {
    private var memento: Memento
    init(memento: Memento) {
        self.memento = memento
    }
    func getMemento() -> Memento {
        return memento
    }
    func setMemento(_ memento: Memento) {
        self.memento = memento
    }
}
