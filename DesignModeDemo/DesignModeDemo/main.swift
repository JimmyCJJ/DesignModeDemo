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
//    simpleFactoryMode()
    // 需求：解耦负责生成用户表对象的方法
//    factoryMethodMode()
    // 需求：支持拿到用户表和登录表
//    abstractFactoryMode()
    // 需求：商场里面经常举办活动，实现一个类，支持切换不同的折扣策略
//    stratery1Mode()
    // 需求：设计一个广告栏，支持n种广告的定制，并且可以通过设置优先级来决定最后显示哪个广告
//    stratery2Mode()
    // 需求：创建一个全局唯一的音乐播放器管理对象，负责播放音乐、暂停音乐等逻辑处理
//    singletonMode()
    // 需求：封装一个控件，可以设置长宽高等属性
//    builderMode()
    // 需求：克隆一个对象，浅克隆/深克隆
//    cloneMode()
    // 需求：设计一个适配器，兼容新的接口
//    adapterMode()
    // 需求：给一个类扩展新的功能
//    decoratorMode()
    // 需求：设计一个拦截器，拦截请求并做一些校验后转发给真正的服务器
//    delegateMode()
    // 需求：设计一套方便客户端投资的接口
//    appearanceMode()
    // 需求：设计一个跨平台播放的播放器，平台有iOS，Android，PC，Mac，Linux；支持的视频格式有MP4，AVI，FLV格式
//    bridgeMode()
    // 需求：赋予一个人洗衣服，洗碗，扫地的能力
//    combinationMode()
    // 需求：设计一个字符串对象池，使传入相同的字符串返回的是同一个对象
//    flyweightMode()
    // 需求：用代码实现男生和女生一天的行程
//    templateMethodMode()
    // 需求：观察某个对象的变量的变化 / 实现一个发布/订阅机制
//    observerMode()
    // 需求：设计一个遍历各种容器的迭代器
//    interatorMode()
    // 需求：设计一条任务执行链
//    chainOfResponsibilityMode()
    // 需求：封装请求
//    commandMode()
    // 需求：设计一个备忘录
//    memorandumMode()
    // 需求：实现一个播放器的状态流转
    statusMode()
//    visitorMode()
//    mediatorMode()
//    interpreterMode()
}

func getOptionString(_ optional: Optional<Any>) -> String {
    return String(describing: optional)
}

// 简单工厂模式
// 定义：把创建对象的具体实现封装起来，可以根据不同的需求生成不同的对象，生成的是一个抽象/协议对象（所有的产品类不应有太大差异，能抽象出相同的接口），面向接口编程
// 优点：客户端不依赖具体的对象也不关心对象的生成过程，方便内部统一维护，接口一致
// 缺点：新增一个产品类需要修改内部生成对象的方法，不符合开闭原则
func simpleFactoryMode() {
    let sqlUserTable: Table? = SimpleFactory.createProduct(type: "a")
    let oracleUserTable: Table? = SimpleFactory.createProduct(type: "b")
    print("简单工厂模式：" + "\nsqlUserTable=\(getOptionString(sqlUserTable))" + "\noracleUserTable=\(getOptionString(oracleUserTable))");
}

// 工厂方法模式
// 定义：是对简单工厂模式的一次改良，简单工厂模式中所有产品类的创建都耦合在同一个方法里面，不符合开闭原则；工厂方法中不同的产品类都对应相应的工厂类。
// 优点：拓展性更好，新增一个产品类不会影响到原有的代码设计，减少影响面，符合开闭原则
// 缺点：由于每新增一个产品类就要对应新增一个具体工厂类，提升了结构设计的复杂度和冗余程度；对于客户端来说，需要依赖具体工厂，判断实例化哪一个对象的逻辑下方到了客户端
func factoryMethodMode() {
    let sqlUserTable: Table? = MysqlFactory().createUser()
    let oracleUserTable: Table? = OracleFactory().createUser()
    print("工厂方法模式：" + "\nsqlUserTable=\(getOptionString(sqlUserTable))" + "\noracleUserTable=\(getOptionString(oracleUserTable))");
}

// 抽象工厂模式
// 定义：是对工厂方法模式的一次扩展，工厂方法模式中一个工厂类只对应一种产品，但在某些业务场景中需要对应多种产品，这就需要用到抽象工厂模式
// 优点：拓展性最好，更加灵活
// 缺点: 复杂性更高
func abstractFactoryMode() {
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
func stratery1Mode() {
    let resultA = StrateryController(ComparetorType.A).getResult()
    print("result == \(getOptionString(resultA))")
    let resultB = StrateryController(ComparetorType.B).getResult()
    print("result == \(getOptionString(resultB))")
}

func stratery2Mode() {
    let comparetor: Comparetor? = StrateryController().request()
    comparetor?.compare()
}

// 单例模式
// 定义：创建一个唯一的对象，该对象可以在整个应用程序的生命周期中一直存活
// 优点：减少对象创建销毁的消耗，更方便地管理一些全局使用的状态值或者功能，利于数据共享和数据传递
// 缺点：由于全局共享单例对象的一些状态，某个地方修改不当容易引起bug；单例对象如果太大也会一直占用内存
func singletonMode() {
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
func builderMode() {
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
func cloneMode() {
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

// 适配器模式
// 定义：已有接口可能不适用于新的目标接口，这时候可以使用一个适配器对象去利用旧接口实现目标接口，需要三个角色：源对象、目标对象、适配器对象
// 优点：不需改动已有接口，无影响面；如果不需要新接口了把适配器删掉即可
// 缺点：由于适配器相当于多封装了一层接口调用，接口实现实际上是由内部的源对象进行，太多的适配器对象可能会让系统更加凌乱
func adapterMode() {
    let source = SourceObject(age: 28, weight: 140)
    let result1 = source.getResult()
    print("适配前-\(result1)")
    
    let adapter = AdapterObject(source)
    let result2 = adapter.getResult()
    print("适配后-\(result2)")
}

// 装饰器模式
// 定义：当想为一个类添加额外的功能并且又没办法直接修改这个类内部的代码的时候可以创建一个装饰者对象，利用组合的方式去添加新的功能
// 优点：可以扩展原有类的功能而不影响原有类，遵守开闭原则
// 缺点：一般需要重写被装饰类的接口，会增加更多的二次调用代码，新增大量装饰者类增加程序复杂性；如果涉及到动态装饰时，代码实现会更加复杂
func decoratorMode() {
    let strongMan = ManDecorator(man: Man())
    strongMan.run()
    strongMan.fly()
}

// 代理模式
// 定义：被代理者委托代理者完成某些事
// 优点：可以在不修改原有方法的情况下新增功能，相当于实现AOP
// 缺点：静态代理由于代理对象需要与被代理对象实现相同的接口，所有会有很多代理类；动态代理比直接调用业务类的方法要慢，因为经过了一层转发
func delegateMode() {
    // iOS代理
    print("-----iOS代理-----")
    let server = Server()
    let delegate = DelegateClient(server)
    let client = Client(delegate)
    client.sendRequest()
    client.sendMsg("hello")
//
    // Java静态代理
    print("-----Java静态代理-----")
    let server1 = Server()
    let client1 = DelegateClient(server1)
    client1.sendRequest()
    client1.sendMsg("你好")
    
    // Java动态代理
    print("-----Java动态代理-----")
    let target = Target()
    let proxy = OCProxy(target: target)
    proxy.perform(#selector(Target.print))
    proxy.perform(#selector(TargetProtocol.sendRequest))
    proxy.perform(#selector(TargetProtocol.sendMsg(_:)), with: "yeah")
    // 实现proxy.invokeBlock就可以回调出来处理方法调用，类似Java动态代理，由于swift不存在NSInvocation *，所以没办法演示
}

// 外观模式
// 定义：封装一个复杂系统，让客户端不依赖于子系统，提供方便使用的接口
// 优点：简化交互方式；解耦合；提高可维护性
// 缺点：不符合开闭原则；隐藏了潜在问题
// 应用场景：子系统接口复杂；需要将子系统划分为多个层次；解耦客户端与子系统；复杂的library/跨平台的程序/电商系统等
func appearanceMode() {
    let appearance = fundAppearance()
    appearance.buy()
    appearance.sell()
}

// 桥接模式
// 定义：分离抽象与实现，使相关联的类可以独立变化，独立扩展
// 优点：拓展性强，遵守开闭原则
// 缺点：要分清哪些部分可以独立变化
func bridgeMode() {
    Android(Mp4Video()).openVideo()
    Ios(FLVVideo()).openVideo()
    Pc(AVIVideo()).openVideo()
    Mac(FLVVideo()).openVideo()
    Linux(FLVVideo()).openVideo()
}

// 组合模式
// 定义：可以将类似功能的类组合成一个抽象类，客户端调用抽象类的接口时内部会调用对应功能类的接口
// 优点：不需要使用继承就可以得到对应的能力，减少层级复杂性，灵活性强
// 缺点：违反单一职责原则，组合不好容易形成大杂烩的类
func combinationMode() {
    let people = People()
    people.washClothes()
    people.washDishes()
    people.sweep()
}

// 享元模式
// 定义：如果一个对象可以把内在变量和外在变量分开，那么就可以创造一个对象池，来保存相同的对象
// 优点：节省内存，可以避免创建重复对象，两个内在一样的对象可以通过外在变量而有不同的表现
// 缺点：性能方面会有所消耗，因为设计到哈希表的存储、查询等操作；如果对象的状态会变化也是不适合使用
func flyweightMode() {
    let obj1 = StringObj.createObj(str: "1")
    let obj2 = StringObj.createObj(str: "1")
    let obj3 = StringObj.createObj(str: "2")
    printSelf(obj1)
    print(obj1.str)
    
    printSelf(obj2)
    print(obj2.str)
    
    printSelf(obj3)
    print(obj3.str)
}

// 模板方法模式
// 定义：父类定义一套标准流程的算法，子类按需覆盖方法去执行不同的操作，简单来说就是把重复代码上升到父类，子类可以覆盖任意一个步骤实现差异化
// 优点：
//  1.利用模板方法将相同处理逻辑的代码放到抽象父类中，可以提高代码的复用性
//  2.将不同的代码不同的子类中，通过对子类的扩展增加新的行为，提高代码的扩展性
//  3.把不变的行为写在父类上，去除子类的重复代码，提供了一个很好的代码复用平台，符合开闭原则
// 缺点：
//  1.类数目的增加，每一个抽象类都需要一个或以上子类来实现，这样导致类的个数增加
//  2.类数量的增加，简介地增加了系统实现的复杂度
//  3.继承关系自身缺点，如果父类添加新的抽象方法，所有子类都要改一遍
func templateMethodMode() {
    let boy = Boy()
    boy.beginOneDay()
    let girl = Girl()
    girl.beginOneDay()
}

// 观察者模式
// 定义：观察者模式是一种行为型设计模式，它定义了一种一对多的依赖关系，让多个观察者对象同时监听某一个主题对象，当主题对象的状态发生变化时，它会通知所有观察者对象，使它们能够自动更新自己。

// 优点：
// 1.实现了对象之间的抽象耦合，增加了灵活性和可扩展性。
// 2.支持广播通信，可以实现多对多的交互。
// 缺点：
// 1.如果观察者数量过多或者处理时间过长，会影响主题对象的状态更新和通知效率。
// 2.如果观察者之间有依赖关系，可能会导致循环调用或者不一致的状态。
// 适用场景：
// 1.当一个对象的状态变化需要通知其他对象，并且这些对象之间是松散耦合的时候。
// 2.当需要支持广播通信的场景，例如GUI事件处理，订阅者可以根据自己的需要订阅不同的事件，例如按钮点击，鼠标移动等。
// 例如，一个电商网站的订单系统，当用户下单时，可以通知库存系统，物流系统，支付系统等不同的观察者进行相应的处理。


// 发布订阅模式
// 定义：发布订阅模式是一种消息型设计模式，它定义了一个调度中心，称为发布者或者代理，它维护了一个订阅者列表，当有新的消息时，它会遍历这个列表，将消息发送给所有订阅者。
// 优点：
// 1.实现了对象之间的完全解耦，发布者和订阅者不需要知道对方的存在和细节。
// 2.支持异步通信，发布者可以将消息发送到消息队列或者中间件，订阅者可以在合适的时机接收和处理消息。
// 缺点：
// 1.增加了系统的复杂度和开销，需要实现和维护一个稳定的调度中心。
// 2.可能会导致消息的延迟或者丢失，需要考虑消息的可靠性和一致性。
// 适用场景：
// 1.当一个对象的状态变化需要通知多个对象，并且这些对象之间是完全解耦的时候。
// 2.当需要支持异步通信的场景，例如分布式系统，微服务架构，事件驱动系统等。
// 例如，一个新闻网站的推送系统，当有新的新闻发布时，可以将新闻内容发送到一个消息中心，订阅者可以根据自己的兴趣和偏好订阅不同的主题，例如体育，娱乐，科技等。

func observerMode() {
    // 观察者模式 本例写死监听status，可以改造为监听指定变量
    let son = Son()
    let father = Father()
    let mother = Mother()
    son.addObserver(father)
    son.addObserver(mother)
    son.changeStatus(SonStatus.sad)
    
    son.removeObserver(mother)
    son.changeStatus(SonStatus.smile)
    
    son.addObserver(mother)
    son.removeObserver(father)
    son.changeStatus(SonStatus.happy)
    
    // 发布订阅模式
    let platform = BookPlatformer()
    let publisher = Publisher()
    
    let subscriber1 = Subscriber()
    let subscriber2 = Subscriber()
    
    platform.registerSubscribe(subscriber1)
    platform.registerSubscribe(subscriber2)
    publisher.postMessage(platform, "发布了新书-三国演义")
}

// 迭代子（器）模式
// 定义：提供一种方法，以指定策略的顺序访问集合对象中的各个元素，而不暴露该对象的内部表示
// 优点：分离了集合对象的遍历行为;抽象出了迭代器负责集合对象的遍历，可以让外部的代码透明的访问集合内部的数据
// 缺点：类的个数成对增加;迭代器模式将存储数据和遍历数据两个职责拆分;如果新添加一个集合类，需要增加该集合类对应的迭代器类，类的个数成对增加在一定程度上增加了系统复杂性
func interatorMode() {
    let arr = OneArray(array: ["1", "2", "4", "3"])
    Interator.traverse(arr) { element in
        print(element)
    }
    
    let dic = OneDictionary(dictionary: ["a":1,"b":2,"c":4,"d":3])
    Interator.traverse(dic) { element in
        print(element)
    }
}

// 责任链模式
// 定义：在责任链模式里，很多对象由每一个对象对其下家的引用而连接起来形成一条链。请求在这个链上传递，直到链上的某一个对象决定处理此请求。发出这个请求的客户端并不知道链上的哪一个对象最终处理这个请求，这使得系统可以在不影响客户端的情况下动态地重新组织和分配责任。
// 优点：
// 1.解耦责任：责任链模式将请求的发送者和接收者解耦，发送者无需知道请求将由哪个接收者处理，接收者也无需知道请求的发送者是谁。这增强了系统的灵活性和可扩展性。
// 2.动态组合：责任链模式允许动态地组合和调整对象的顺序和组成，可以根据需要增加、删除或重新排序链中的对象，而不影响已有的代码。这样可以灵活地构建不同的处理链，适应不同的业务需求。
// 缺点：
// 1.可能引起性能问题：如果责任链过长或链中的对象过多，请求可能需要遍历整个链才能找到合适的处理者，这可能会影响系统的性能。
// 2.不一定能被处理：责任链模式的每个职责对象只负责自己处理的那一部分，因此可能会出现某个请求，把整个链传递完了，都没有职责对象处理它。这就需要在使用责任链模式的时候，需要提供默认的处理，并且注意构建的链的有效性。
func chainOfResponsibilityMode() {
    let chain = ChainHandler()
    let params = ChainHandlerParams()
    params.string = "责任链模式"
    let intercept1 = Intercept1()
    let intercept2 = Intercept2()
    chain.setParams(params)
        .add(intercept1)
        .add(intercept2)
        .excute()
}

// 命令模式
// 定义：将一个请求封装为一个对象，从而使你可用不同的请求对客户进行参数化；对请求排队或记录请求日志，以及支持可撤消的操作。
// 优点：
// 1.降低对象之间的耦合度。
// 2.新的命令可以很容易地加入到系统中。
// 3.可以比较容易地设计一个组合命令。
// 4.调用同一方法实现不同的功能
// 缺点：使用命令模式可能会导致某些系统有过多的具体命令类。因为针对每一个命令都需要设计一个具体命令类，因此某些系统可能需要大量具体命令类，这将影响命令模式的使用。
// 适用场景：
// 1.系统需要将请求调用者和请求接收者解耦，使得调用者和接收者不直接交互。
// 2.系统需要在不同的时间指定请求、将请求排队和执行请求。
// 3.系统需要支持命令的撤销(Undo)操作和恢复(Redo)操作。
// 4.系统需要将一组操作组合在一起，即支持宏命令。

func commandMode() {
    // 简单实现，复杂业务场景有待补充
    Invoker(WashClothesCommand()).invoke()
    Invoker(SweepCommand()).invoke()
    Invoker(CleanCommand()).invoke()
}

// 备忘录模式
// 定义：保存一个对象的某个状态，以便在适当的时候恢复对象。（后悔药模式）
// 优点：
// 1.实现了信息的封装，使得用户不需要关心状态的保存细节。
// 2.给用户提供了一种可以恢复状态的机制，可以使用户能够比较方便地回到某个历史的状态
// 缺点：如果成员变量过多或者快照过多，会占用比较大的资源。
func memorandumMode() {
    let originator = Originator()
    originator.setState("A")
    originator.printState()
    print("修改")
    let caretaker = Caretaker(memento: originator.createMemento())
    originator.setState("B")
    originator.printState()
    print("修改")
    originator.setState("C")
    originator.printState()
    print("撤销")
    originator.restoreMemento(caretaker.getMemento())
    originator.printState()
}

// 状态模式&状态机
// 定义：主要用来解决对象在多种状态转换时，需要对外输出不同的行为的问题。状态和行为是一一对应的，状态之间可以相互转换。而状态机是状态模式的一种典型的使用例子，这里只讨论有限状态机。状态机有3个组成部分：状态（State）、事件（Event）、动作（Action）。其中，事件也称为转移条件（Transition Condition）。事件触发状态的转移及动作的执行。不过，动作不是必须的，也可能只转移状态，不执行任何动作。实现状态机的方法有多种，比较常用的有分支逻辑法、查表法、状态模式。
// 优点：
// 1.可以将不同的状态隔离;每个状态都是一个单独的类。
// 2.可以将各种状态的转换逻辑，分布到状态的子类中，减少相互依赖。
// 3.增加新状态，操作简单。
// 缺点：如果状态数量比较多，状态类的数量会增加，业务场景系统变得很复杂；如果业务中某个对象由几十上百个状态，就会很复杂，这时就需要对状态进行拆分处理。
// 适用场景：一个对象存在多个状态；状态可以相互转换；不同状态下行为不同。
func statusMode() {
    // 1.分支逻辑法
    print("--分支逻辑法--")
    let action1 = MusicAction1(player: MusicPlayer1())
    action1.playOrPauseAction()
    action1.playOrPauseAction()
    action1.playOrPauseAction()
    action1.stopAction()
    action1.playOrPauseAction()
    action1.stopAction()
    
    // 2.查表法
    print("--查表法--")
    let action2 = MusicAction2(player: MusicPlayer2())
    action2.playOrPauseAction()
    action2.playOrPauseAction()
    action2.playOrPauseAction()
    action2.stopAction()
    action2.playOrPauseAction()
    action2.stopAction()
    
    // 3.状态模式
    print("--状态模式--")
    let action3 = MusicAction3(player: MusicPlayer3())
    action3.playOrPauseAction()
    action3.playOrPauseAction()
    action3.playOrPauseAction()
    action3.stopAction()
    action3.playOrPauseAction()
    action3.stopAction()
}

// 访问者模式
// 定义：
// 优点：
// 缺点：
func visitorMode() {
    
}

// 中介者模式
// 定义：
// 优点：
// 缺点：
func mediatorMode() {
    
}

// 解释器模式
// 定义：
// 优点：
// 缺点：
func interpreterMode() {
    
}
