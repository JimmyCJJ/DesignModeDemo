//
//  FactoryMethodAndSimpleFactory.swift
//  DesignModeDemo
//
//  Created by 曹鉴津 on 2023/5/21.
//

import Foundation

protocol Table {
    func add()
    func delete()
    func revise()
    func query()
}

class MysqlUserTable: Table {
    func add() {
        print("Mysql User表 增")
    }
    func delete() {
        print("Mysql User表 删")
    }
    func revise() {
        print("Mysql User表 改")
    }
    func query() {
        print("Mysql User表 查")
    }
}

class MysqlLoginTable: Table {
    func add() {
        print("Mysql Login表 增")
    }
    func delete() {
        print("Mysql Login表 删")
    }
    func revise() {
        print("Mysql Login表 改")
    }
    func query() {
        print("Mysql Login表 查")
    }
}

class OracleUserTable: Table {
    func add() {
        print("Oracle User表 增")
    }
    func delete() {
        print("Oracle User表 删")
    }
    func revise() {
        print("Oracle User表 改")
    }
    func query() {
        print("Oracle User表 查")
    }
}

class OracleLoginTable: Table {
    func add() {
        print("Oracle Login表 增")
    }
    func delete() {
        print("Oracle Login表 删")
    }
    func revise() {
        print("Oracle Login表 改")
    }
    func query() {
        print("Oracle Login表 查")
    }
}

protocol Database {
    func use()
    func createUserTable() -> Table
    func createLoginTable() -> Table
}

class Mysql: Database {
    func use() {
        print("正在使用Mysql数据库")
    }
    func createUserTable() -> Table {
        return MysqlUserTable()
    }
    func createLoginTable() -> Table {
        return MysqlLoginTable()
    }
}

class Oracle: Database {
    func use() {
        print("正在使用Oracle数据库")
    }
    func createUserTable() -> Table {
        return OracleUserTable()
    }
    func createLoginTable() -> Table {
        return OracleLoginTable()
    }
}

class SimpleFactory {
    class func createProduct(type: String) -> Table? {
        var product: Table?
        if (type == "a") {
            product = Mysql().createUserTable()
        } else if (type == "b") {
            product = Oracle().createUserTable()
        }
        return product;
    }
}

protocol Factory {
    func createUser() -> Table?
    func createLogin() -> Table?
}

class MysqlFactory: Factory {
    func createUser() -> Table? {
        return Mysql().createUserTable()
    }
    func createLogin() -> Table? {
        return Mysql().createLoginTable()
    }
}

class OracleFactory: Factory {
    func createUser() -> Table? {
        return Oracle().createUserTable()
    }
    func createLogin() -> Table? {
        return Oracle().createLoginTable()
    }
}


