//
//  PlayView.swift
//  Hot Potato TV
//
//  Created by Chris Voronin on 2/17/23.
//

import SwiftUI

struct PlayView: View {
    
    var category:GameCategory
    var music:GameCategory
    
    @State var isHotPotato = false
    @State var timeRemaining = 10
    private let minInterval = 13
    private let maxInterval = 30
    @State private var musicState = 0
    @State var hasStarted = false
    //1 with timer, 2 no timer
    @State var currentDate = Date.now
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    var categories:[GameCategory] = [GameCategory(type: 1, title: "Classic", subTitle: "Play with music timer which will pause randomly.", image: "hotpotato"),GameCategory(type: 2, title: "Player", subTitle: "Play with music that is paused via remote.", image: "hotpotato"),GameCategory(type: 3, title: "No Timer", subTitle: "Music does not stop, only way to lose is to drop.", image: "hotpotato")]
    
    var body: some View {
        ZStack {
            Image(isHotPotato ? "hotpotato2" : "hotpotato")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .blur(radius: musicState == 0 ? 0 : 0)
            VStack() {
                Text(hasStarted ? isHotPotato ? "HOT POTATO!" : "KEEP PASSING..." : "START MUSIC")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    //.padding(25).background(.black.opacity(0.5))
                    .cornerRadius(20)

                Button {
                    buttonPressed()
                } label: {
                    Image(systemName: musicState == 0 ? "play.circle" : "pause.circle")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .foregroundColor(.white)
                }
            }
        }
        .onReceive(timer) { input in
            if category.type == 2 {
                return
            }
            onTimer()
        }.onAppear {
            MusicPlayer.shared.stop()
        }.onDisappear {
            MusicPlayer.shared.stop()
        }
    }
    
    func onTimer() {
        if musicState == 0 {
            return
        }
        timeRemaining -= 1
        if timeRemaining <= 0 {
            pause()
        }
    }
    
    func playSound() {
        MusicPlayer.shared.playSound(sound: "complete", type: "wav")
    }
    
    func buttonPressed() {
        if musicState == 0 {
            play()
        } else {
            pause()
        }
    }
    
    private func pause() {
        musicState = 0
        isHotPotato = true
        MusicPlayer.shared.pause()
        playSound()
        timeRemaining = Int.random(in: minInterval...maxInterval)
    }
    
    private func play() {
        musicState = 1
        hasStarted = true
        isHotPotato = false
        timeRemaining = Int.random(in: minInterval...maxInterval)
        MusicPlayer.shared.play(music.image)
    }
}

struct PlayView_Previews: PreviewProvider {
        
    static let music = GameCategory(type: 1, title: "Bumble Bee", subTitle: "Flight of the Bumble Bee by Nikolai Rimsky-Korsakov", image: "bee")
    static let cat = GameCategory(type: 1, title: "Classic", subTitle: "Play with music timer which will pause randomly.", image: "hotpotato")
    static var previews: some View {
        PlayView(category: cat, music: music)
    }
}

struct ClearRoundButton: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(40)
            .font(.title)
            .background( Circle()
                .fill(Color.clear))
    }

}
