//
//  Status.swift
//  DesignModeDemo
//
//  Created by caojianjin on 2023/6/1.
//

import Foundation

enum MusicPlayerState: Int {
    case none
    case play
    case pause
}

enum MusicPlayerEvent: Int {
    case stop
    case playOrPause
}

class MusicAction1 {
    var player: MusicPlayer1
    init(player: MusicPlayer1) {
        self.player = player
    }
    func playOrPauseAction() {
        player.playOrPause()
    }
    
    func stopAction() {
        player.stop()
    }
}

class MusicPlayer1 {
    var state = MusicPlayerState.none {
        didSet {
            print("\(state)")
        }
    }
    
    func playOrPause() {
        if (state == MusicPlayerState.none) {
            state = MusicPlayerState.play
        } else if (state == MusicPlayerState.play) {
            state = MusicPlayerState.pause
        } else if (state == MusicPlayerState.pause) {
            state = MusicPlayerState.play
        }
    }
    
    func stop() {
        if (state == MusicPlayerState.play || state == MusicPlayerState.pause) {
            state = MusicPlayerState.none
        }
    }
}

class MusicAction2 {
    var player: MusicPlayer2
    init(player: MusicPlayer2) {
        self.player = player
    }
    func playOrPauseAction() {
        player.playOrPause()
    }
    
    func stopAction() {
        player.stop()
    }
}

class MusicPlayer2 {
    let stateTable = [
        [MusicPlayerState.none, MusicPlayerState.play],
        [MusicPlayerState.none, MusicPlayerState.pause],
        [MusicPlayerState.none, MusicPlayerState.play]
    ]
    var state = MusicPlayerState.none {
        didSet {
            print("\(state)")
        }
    }
    
    func playOrPause() {
        state = stateTable[state.rawValue][MusicPlayerEvent.playOrPause.rawValue]
    }
    
    func stop() {
        state = stateTable[state.rawValue][MusicPlayerEvent.stop.rawValue]
    }
}

class MusicAction3 {
    var player: MusicPlayer3
    init(player: MusicPlayer3) {
        self.player = player
    }
    func playOrPauseAction() {
        player.playOrPause()
    }
    
    func stopAction() {
        player.stop()
    }
}

protocol MusicState {
    var player: MusicPlayer3? { get set }
    func action()
}

class MusicStateNone: MusicState {
    weak var player: MusicPlayer3?
    init(player: MusicPlayer3) {
        self.player = player
    }
    
    func action() {
        player?.currentState = player?.playState
    }
}

class MusicStatePlay: MusicState {
    weak var player: MusicPlayer3?
    init(player: MusicPlayer3) {
        self.player = player
    }
    
    func action() {
        player?.currentState = player?.pauseState
    }
}

class MusicStatePause: MusicState {
    weak var player: MusicPlayer3?
    init(player: MusicPlayer3) {
        self.player = player
    }
    
    func action() {
        player?.currentState = player?.playState
    }
}

class MusicPlayer3 {
    var noneState: MusicState?
    var playState: MusicState?
    var pauseState: MusicState?
    var currentState: MusicState? {
        didSet {
            print("\(String(describing: currentState))")
        }
    }
    
    init() {
        noneState = MusicStateNone(player: self)
        playState = MusicStatePlay(player: self)
        pauseState = MusicStatePause(player: self)
        currentState = noneState
    }
    
    func playOrPause() {
        currentState?.action()
    }
    
    func stop() {
        currentState = noneState
    }
}
