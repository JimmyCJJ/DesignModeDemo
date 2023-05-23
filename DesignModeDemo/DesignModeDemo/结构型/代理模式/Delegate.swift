//
//  Delegate.swift
//  DesignModeDemo
//
//  Created by caojianjin on 2023/5/23.
//

import Foundation

protocol ClientProtol {
    func sendRequest()
    func sendMsg(_ msg: String)
}

class Server {
    
}

class DelegateClient: ClientProtol {
    var server: Server
    init(_ server: Server) {
        self.server = server
    }
    func sendRequest() {
        print("发送请求给\(server)")
    }
    func sendMsg(_ msg: String) {
        print("发送消息：\(msg.description)")
    }
}

class Client: ClientProtol {
    var delegate: ClientProtol
    init(_ delegate: ClientProtol) {
        self.delegate = delegate
    }
    func sendRequest() {
        delegate.sendRequest()
    }
    func sendMsg(_ msg: String) {
        delegate.sendMsg(msg)
    }
}

class StaticDelegateClient: ClientProtol {
    var client: StaticClient
    init(_ server: Server) {
        client = StaticClient(server)
    }
    func sendRequest() {
        print("正在校验...")
        print("校验成功")
        client.sendRequest()
    }
    func sendMsg(_ msg: String) {
        print("正在发送...")
        print("发送成功")
        client.sendMsg(msg)
    }
}

class StaticClient: ClientProtol {
    var server: Server
    init(_ server: Server) {
        self.server = server
    }
    func sendRequest() {
        print("发送请求给\(server)")
    }
    func sendMsg(_ msg: String) {
        print("发送消息：\(msg.description)")
    }
}
