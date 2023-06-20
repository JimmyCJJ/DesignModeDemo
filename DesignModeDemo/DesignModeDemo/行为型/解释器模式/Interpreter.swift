//
//  Interpreter.swift
//  DesignModeDemo
//
//  Created by caojianjin on 2023/6/1.
//

import Foundation

class InterpreterContext {
    let nums = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    let lowerLetter = ["a", "b", "c", "d", "e", "f", "g"]
    let biggerLetter = ["A", "B", "C", "D", "E", "F", "G"]
    
    let numsInterpreter: Interpreter?
    let lowerLetterInterpreter: Interpreter?
    let biggerLetterInterpreter: Interpreter?
    let unResultInterpreter: Interpreter?
    
    var string: String
    
    init(_ string: String) {
        self.string = string
        numsInterpreter = ResultInterpreter(data: nums)
        lowerLetterInterpreter = ResultInterpreter(data: lowerLetter)
        biggerLetterInterpreter = ResultInterpreter(data: biggerLetter)
        unResultInterpreter = UnResultInterpreter(nums: numsInterpreter!, lowerLetter: lowerLetterInterpreter!, biggerLetter: biggerLetterInterpreter!)
    }
    
    func explain() -> Bool {
        print("开始解析\(string)")
        return unResultInterpreter!.interpreter(string)
    }
}

protocol Interpreter {
    func interpreter(_ string: String) -> Bool
}

class UnResultInterpreter: Interpreter {
    var nums: Interpreter
    var lowerLetter: Interpreter
    var biggerLetter: Interpreter
    
    init(nums: Interpreter, lowerLetter: Interpreter, biggerLetter: Interpreter) {
        self.nums = nums
        self.lowerLetter = lowerLetter
        self.biggerLetter = biggerLetter
    }
    
    func interpreter(_ string: String) -> Bool {
        let arr = string.components(separatedBy: "-")
        if (arr.count != 3) {
            return false
        }
        return nums.interpreter(arr[0]) && lowerLetter.interpreter(arr[1]) && biggerLetter.interpreter(arr[2])
    }
}

class ResultInterpreter: Interpreter {
    var data: [String]
    init(data: [String]) {
        self.data = data
    }
    func interpreter(_ string: String) -> Bool {
        return data.contains {
            $0 == string
        }
    }
}
