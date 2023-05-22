//
//  main.swift
//  DesignModeDemo
//
//  Created by 曹鉴津 on 2023/5/21.
//

import Foundation

main()

func main() {
    // 需求1：拿到某个数据库的用户表
    simpleFactory()
    // 需求2：解耦负责生成用户表对象的方法
    factoryMethod()
    // 需求3：支持拿到用户表和登录表
    abstractFactory()
    stratery()
}

func getOptionString(_ optional: Optional<Any>) -> String {
    return String(describing: optional)
}

func simpleFactory() {
    // 简单工厂模式
    // 定义：把创建对象的具体实现封装起来，可以根据不同的需求生成不同的对象，生成的是一个抽象/协议对象（所有的产品类不应有太大差异，能抽象出相同的接口），面向接口编程
    // 优点：客户端不依赖具体的对象也不关心对象的生成过程，方便内部统一维护，接口一致
    // 缺点：新增一个产品类需要修改内部生成对象的方法，不符合开闭原则
    let sqlUserTable: Table? = SimpleFactory.createProduct(type: "a")
    let oracleUserTable: Table? = SimpleFactory.createProduct(type: "b")
    print("简单工厂模式：" + "\nsqlUserTable=\(getOptionString(sqlUserTable))" + "\noracleUserTable=\(getOptionString(oracleUserTable))");
}

func factoryMethod() {
    // 工厂方法模式
    // 定义：是对简单工厂模式的一次改良，简单工厂模式中所有产品类的创建都耦合在同一个方法里面，不符合开闭原则；工厂方法中不同的产品类都对应相应的工厂类。
    // 优点：拓展性更好，新增一个产品类不会影响到原有的代码设计，减少影响面，符合开闭原则
    // 缺点：由于每新增一个产品类就要对应新增一个具体工厂类，提升了结构设计的复杂度和冗余程度；对于客户端来说，需要依赖具体工厂，判断实例化哪一个对象的逻辑下方到了客户端
    let sqlUserTable: Table? = MysqlFactory().createUser()
    let oracleUserTable: Table? = OracleFactory().createUser()
    print("工厂方法模式：" + "\nsqlUserTable=\(getOptionString(sqlUserTable))" + "\noracleUserTable=\(getOptionString(oracleUserTable))");
}

func abstractFactory() {
    // 抽象工厂模式
    // 定义：是对工厂方法模式的一次扩展，工厂方法模式中一个工厂类只对应一种产品，但在某些业务场景中需要对应多种产品，这就需要用到抽象工厂模式
    // 优点：拓展性最好，更加灵活
    // 缺点: 复杂性更高
    let sqlUserTable: Table? = MysqlFactory().createUser()
    let oracleUserTable: Table? = OracleFactory().createUser()
    let sqlLoginTable: Table? = MysqlFactory().createLogin()
    let oracleLoginTable: Table? = OracleFactory().createLogin()
    print("抽象工厂模式：" + "\nsqlUserTable=\(getOptionString(sqlUserTable))" + "\noracleUserTable=\(getOptionString(oracleUserTable))" + "\nsqlLoginTable=\(getOptionString(sqlLoginTable))" + "\noracleLoginTable=\(getOptionString(oracleLoginTable))");
}

func stratery() {
    let comparetor: Comparetor? = strateryController().request()
    comparetor?.compare()
}
