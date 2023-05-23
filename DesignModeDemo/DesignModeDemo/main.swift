//
//  main.swift
//  DesignModeDemo
//
//  Created by 曹鉴津 on 2023/5/21.
//

import Foundation

main()

func main() {
    // 需求：拿到某个数据库的用户表
//    simpleFactory()
    // 需求：解耦负责生成用户表对象的方法
//    factoryMethod()
    // 需求：支持拿到用户表和登录表
//    abstractFactory()
    // 需求：商场里面经常举办活动，实现一个类，支持切换不同的折扣策略
//    stratery1()
    // 需求：设计一个广告栏，支持n种广告的定制，并且可以通过设置优先级来决定最后显示哪个广告
//    stratery2()
    // 需求：创建一个全局唯一的音乐播放器管理对象，负责播放音乐、暂停音乐等逻辑处理
//    singleton()
    // 需求：封装一个控件，可以设置长宽高等属性
//    builder()
    // 需求：克隆一个对象，浅克隆/深克隆
    clone()
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

// 单例模式
// 定义：创建一个唯一的对象，该对象可以在整个应用程序的生命周期中一直存活
// 优点：减少对象创建销毁的消耗，更方便地管理一些全局使用的状态值或者功能，利于数据共享和数据传递
// 缺点：由于全局共享单例对象的一些状态，某个地方修改不当容易引起bug；单例对象如果太大也会一直占用内存
func singleton() {
    MusicSingleton.sharedSingleton.printNum()
    MusicSingleton.sharedSingleton.musicNum = 99
    MusicSingleton.sharedSingleton.printNum()
    
    MusicSingleton.sharedSingleton.play()
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+3.0) {
        MusicSingleton.sharedSingleton.pause()
    }
    // 由于demo使用Command Line Tool程序 主线程没有RunLoop 所以加上 RunLoop.current.run() 在iOS程序开发中不用添加
    RunLoop.current.run()
}

// 建造者模式
// 定义：将一个复杂对象的构建与其表示分离，使得同样的构建过程可以创建不同的表示
// 优点：不用关心对象创建的过程，只需要传入想要构建的参数即可，一旦构建后就不允许再修改参数，避免不必要的变动；符合面向对象的封装原则，使构建过程和最终表示完全分离
// 缺点：如果需要构建的对象需要大改版，我们就要修改很多内部代码，并且构建的对象是按一定的模板去设计，灵活性不是很高
func builder() {
    let builder = ViewBuilder()
    builder.length = 100
    builder.width = 200
    builder.height = 300
    let view = View.init(builder)
    view.show()
}

// 原型模式
// 定义：克隆一个对象，分为浅克隆和深克隆两种形式
// 优点：有时候我们想要构建一个一模一样的对象，但是在外部去实现是很困难的，特别是这个对象有一些私有变量时，访问不了，这时候就可以让该对象实现克隆接口，并提供给外部调用
// 缺点：支持克隆的类由于需要实现克隆接口，所有要修改内部代码，违反了开-闭原则；特别是实现深克隆的时候，由于嵌套层级比较多，每一个需要深克隆的对象都要去实现克隆接口，复杂性会更高
func clone() {
    let person = Person(age: 27, weight: 140, son: Person(age: 3, weight: 10, son: nil))
    print("father:")
    printSelf(person)
    print("son:")
    printSelf(person.son)
    
    // 浅克隆
    let copyObject = person.copy() as! Person
    print("————————浅克隆————————")
    print("father:")
    printSelf(copyObject)
    print("son:")
    printSelf(copyObject.son)
    
    // 深克隆
    let mutableCopyObject = person.multableCopy() as! Person
    print("————————深克隆————————")
    print("father:")
    printSelf(mutableCopyObject)
    print("son:")
    printSelf(mutableCopyObject.son)
}
