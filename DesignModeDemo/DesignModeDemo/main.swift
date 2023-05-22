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
    // 需求4：商场里面经常举办活动，实现一个类，支持切换不同的折扣策略
    stratery1()
    // 需求5：设计一个广告栏，支持n种广告的定制，并且可以通过设置优先级来决定最后显示哪个广告
    stratery2()
}

func getOptionString(_ optional: Optional<Any>) -> String {
    return String(describing: optional)
}

// 简单工厂模式
// 定义：把创建对象的具体实现封装起来，可以根据不同的需求生成不同的对象，生成的是一个抽象/协议对象（所有的产品类不应有太大差异，能抽象出相同的接口），面向接口编程
// 优点：客户端不依赖具体的对象也不关心对象的生成过程，方便内部统一维护，接口一致
// 缺点：新增一个产品类需要修改内部生成对象的方法，不符合开闭原则
func simpleFactory() {
    let sqlUserTable: Table? = SimpleFactory.createProduct(type: "a")
    let oracleUserTable: Table? = SimpleFactory.createProduct(type: "b")
    print("简单工厂模式：" + "\nsqlUserTable=\(getOptionString(sqlUserTable))" + "\noracleUserTable=\(getOptionString(oracleUserTable))");
}

// 工厂方法模式
// 定义：是对简单工厂模式的一次改良，简单工厂模式中所有产品类的创建都耦合在同一个方法里面，不符合开闭原则；工厂方法中不同的产品类都对应相应的工厂类。
// 优点：拓展性更好，新增一个产品类不会影响到原有的代码设计，减少影响面，符合开闭原则
// 缺点：由于每新增一个产品类就要对应新增一个具体工厂类，提升了结构设计的复杂度和冗余程度；对于客户端来说，需要依赖具体工厂，判断实例化哪一个对象的逻辑下方到了客户端
func factoryMethod() {
    let sqlUserTable: Table? = MysqlFactory().createUser()
    let oracleUserTable: Table? = OracleFactory().createUser()
    print("工厂方法模式：" + "\nsqlUserTable=\(getOptionString(sqlUserTable))" + "\noracleUserTable=\(getOptionString(oracleUserTable))");
}

// 抽象工厂模式
// 定义：是对工厂方法模式的一次扩展，工厂方法模式中一个工厂类只对应一种产品，但在某些业务场景中需要对应多种产品，这就需要用到抽象工厂模式
// 优点：拓展性最好，更加灵活
// 缺点: 复杂性更高
func abstractFactory() {
    let sqlUserTable: Table? = MysqlFactory().createUser()
    let oracleUserTable: Table? = OracleFactory().createUser()
    let sqlLoginTable: Table? = MysqlFactory().createLogin()
    let oracleLoginTable: Table? = OracleFactory().createLogin()
    print("抽象工厂模式：" + "\nsqlUserTable=\(getOptionString(sqlUserTable))" + "\noracleUserTable=\(getOptionString(oracleUserTable))" + "\nsqlLoginTable=\(getOptionString(sqlLoginTable))" + "\noracleLoginTable=\(getOptionString(oracleLoginTable))");
}

// 策略模式
// 定义：把所有具体的算法封装起来，外界不需要关心某个策略的具体实现，客户端传入算法类即可获取对应结果
// 优点：拓展性好，新增一个算法只需要新增一个算法类，在客户端使用方面利用枚举与算法一一对应的技巧减少客户端使用的负担；算法之前互相独立，修改一个算法的实现不会影响其他算法
// 缺点：客户端需要去了解所有的算法类，并且自行决定使用哪个算法类
func stratery1() {
    let resultA = strateryController(ComparetorType.A).getResult()
    print("result == \(getOptionString(resultA))")
    let resultB = strateryController(ComparetorType.B).getResult()
    print("result == \(getOptionString(resultB))")
}

func stratery2() {
    let comparetor: Comparetor? = strateryController().request()
    comparetor?.compare()
}
