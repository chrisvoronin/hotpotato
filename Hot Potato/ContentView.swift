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
                            .toolbarBackground(Color.white, for: .navigationBar)
                            .toolbarBackground(.visible, for: .navigationBar)
                    } label: {
                        ButtonView(text:"Play Game")
                    }
                    NavigationLink {
                        HowToPlayView()
                            .toolbarBackground(Color.white, for: .navigationBar)
                            .toolbarBackground(.visible, for: .navigationBar)
                    } label: {
                        ButtonView(text:"How To Play")
                    }
                    Button {
                        toggleMusicOn()
                    } label: {
                        ButtonView(text:"Splash Music: \(isMusicOn ? "On" : "Off")")
                    }
                }
                .padding()
            }
        }.tint(.orange)
        .onAppear {
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
            //createActivity()
            MusicPlayer.shared.stop()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonView: View {
    
    var text:String
    
    var body: some View {
        Text(text)
            .padding(20)
            .font(.title)
            .background(Color.orange.opacity(1.0))
            .foregroundColor(.white)
            .cornerRadius(40)
    }
}
