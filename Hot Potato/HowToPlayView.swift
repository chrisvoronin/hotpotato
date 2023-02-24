//
//  HowToPlayView.swift
//  Hot Potato TV
//
//  Created by Chris Voronin on 2/17/23.
//

import SwiftUI

struct HowToPlayView: View {
    
    var rules = ["Players sit in a circle, facing each other."
                     ,"A soft object, such as a beanbag is passed from one player to another around the circle."
                 ,"One player starts the game by holding the object and saying hot potato."
                     ,"The player then quickly passes the object to the person next to them."
                     ,"Each player must pass the object as quickly as possible, without holding onto it for too long."
                 ,"The game continues until someone drops the object or is caught holding it when the music stops."
                     ,"The player who drops the object or is caught holding it when the music stops, is out of the game."
                     ,"The game then continues with the remaining players until only one player is left, who is declared the winner."]
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Image("hotpotato")
                    .resizable()
                    .aspectRatio(geometry.size, contentMode: .fill).blur(radius: 40)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("How To Play")
                        .font(.title).fontWeight(.bold).foregroundColor(.white).padding(.top, 30)
                    ScrollView(.vertical) {
                        VStack(alignment: .leading) {
                            ForEach(rules, id:\.self) {
                                Text($0).font(.headline).foregroundColor(.white)
                                    .padding(5)
                            }
                        }
                    }
                }.padding()
            }
        }
    }
}

struct HowToPlayView_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayView()
    }
}
