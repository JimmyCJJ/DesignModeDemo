//
//  Builder.swift
//  DesignModeDemo
//
//  Created by 曹鉴津 on 2023/5/22.
//

import Foundation

class ViewBuilder {
    var length = 0
    var width = 0
    var height = 0
}

class View {
    private var length = 0
    private var width = 0
    private var height = 0
    
    init(_ builder: ViewBuilder) {
        length = builder.length
        width = builder.width
        height = builder.height
    }
    
    func show() {
        print("已建成--\(length)--\(width)--\(height)")
    }
}
