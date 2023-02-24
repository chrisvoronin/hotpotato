//
//  ContentView.swift
//  Hot Potato TV
//
//  Created by Chris Voronin on 2/16/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var isMusicOn = UserDefaults.standard.object(forKey: "isMusicOn") as? Bool ?? true {
        didSet {
            UserDefaults.standard.set(isMusicOn, forKey: "isMusicOn")
        }
    }
                
    var body: some View {
        NavigationStack {
            ZStack {
                Image("hotpotato").resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    NavigationLink {
                        GameSelectionView()
                    } label: {
                        Text("Play Game")
                    }
                    
                    NavigationLink {
                        HowToPlayView()
                    } label: {
                        Text("How To Play")
                    }
                    Button {
                        toggleMusicOn()
                    } label: {
                        Text("Splash Music: \(isMusicOn ? "On" : "Off")")
                    }
                }
                .padding()
            }
        }.onAppear {
            if isMusicOn {
                MusicPlayer.shared.play("squirrel")
            }
        }
    }
    
    func toggleMusicOn() {
        self.isMusicOn.toggle()
        if isMusicOn {
            MusicPlayer.shared.play("squirrel")
        } else {
            MusicPlayer.shared.stop()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
