//
//  MusicPlayer.swift
//  Hot Potato TV
//
//  Created by Chris Voronin on 2/17/23.
//

import Foundation
import AVFAudio

class MusicPlayer {
    
    static let shared = MusicPlayer()
    
    private var player:AVAudioPlayer?
    
    private var soundPlayer: AVAudioPlayer?

    func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                if soundPlayer == nil {
                    soundPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                }
            } catch {
                print("ERROR")
            }
            soundPlayer?.play()
        }
    }
    
    func play(_ song:String) {
        if player == nil {
            guard let sound = Bundle.main.path(forResource: song, ofType: "mp3") else {
                return
            }
            let url = URL(fileURLWithPath: sound)
            self.player = try? AVAudioPlayer(contentsOf: url)
            self.player?.numberOfLoops = -1 // infinite
        }
        player?.play()
    }
    
    func stop() {
        player?.stop()
        player = nil
    }
    
    func pause() {
        player?.pause()
    }
    
}
