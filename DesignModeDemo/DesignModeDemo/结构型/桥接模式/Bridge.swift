//
//  Bridge.swift
//  DesignModeDemo
//
//  Created by caojianjin on 2023/5/24.
//

import Foundation

protocol Platform {
    var video: Video{get set}
    func openVideo()
}

protocol Video {
    func play()
}

class Android: Platform {
    var video: Video
    
    init(_ video: Video) {
        self.video = video
    }
    func openVideo() {
        print("Android打开视频")
        video.play()
    }
}

class Ios: Platform {
    var video: Video
    
    init(_ video: Video) {
        self.video = video
    }
    func openVideo() {
        print("iOS打开视频")
        video.play()
    }
}

class Pc: Platform {
    var video: Video
    
    init(_ video: Video) {
        self.video = video
    }
    func openVideo() {
        print("PC打开视频")
        video.play()
    }
}

class Mac: Platform {
    var video: Video
    
    init(_ video: Video) {
        self.video = video
    }
    func openVideo() {
        print("Mac打开视频")
        video.play()
    }
}

class Linux: Platform {
    var video: Video
    
    init(_ video: Video) {
        self.video = video
    }
    func openVideo() {
        print("Linux打开视频")
        video.play()
    }
}

class Mp4Video: Video {
    func play() {
        print("播放Mp4视频")
    }
}

class AVIVideo: Video {
    func play() {
        print("播放Avi视频")
    }
}

class FLVVideo: Video {
    func play() {
        print("播放Flv视频")
    }
}
