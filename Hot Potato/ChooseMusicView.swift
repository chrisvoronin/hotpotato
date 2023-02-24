//
//  ChooseMusicView.swift
//  Hot Potato TV
//
//  Created by Chris Voronin on 2/17/23.
//

import SwiftUI

struct ChooseMusicView: View {
    
    var game:GameCategory
    
    private let categories:[GameCategory] = [GameCategory(type: 1, title: "Bumble Bee", subTitle: "Flight of the Bumble Bee by Nikolai Rimsky-Korsakov", image: "bee"),GameCategory(type: 2, title: "Sabre Dance", subTitle: "Classic by Aram Khachaturian.", image: "sabredance"),GameCategory(type: 3, title: "Overture", subTitle: "William Tell Overture by Gioachino Rossini", image: "will"),GameCategory(type: 4, title: "Halls", subTitle: "In the Hall of the Mountain King by Edvard Grieg", image: "halls")]
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Image("hotpotato").resizable()
                        .aspectRatio(geometry.size, contentMode: .fill)
                        .edgesIgnoringSafeArea(.all).blur(radius: 10)
                    VStack() {
                        Text("Choose Music").foregroundColor(.white)
                            .font(.title).fontWeight(.bold).padding(.top, 30)
                        List {
                            ForEach(categories) { cat in
                                NavigationLink {
                                    PlayView(category: game, music: cat).toolbarBackground(Color.white, for: .navigationBar)
                                        .toolbarBackground(.visible, for: .navigationBar)
                                } label: {
                                    HStack(alignment: .top) {
                                        Image(cat.image)
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                        VStack(alignment: .leading) {
                                            Text(cat.title)
                                                .font(.title)
                                                .fontWeight(.bold)
                                            Text(cat.subTitle)
                                                .font(.subheadline)
                                        }
                                        Spacer()
                                    }
                                }
                            }
                        }.listStyle(.plain)
                    }
                }
            }
            
        }
    }
}

struct ChooseMusicView_Previews: PreviewProvider {
    
    static let cat = GameCategory(type: 1, title: "Classic", subTitle: "Play with music timer which will pause randomly.", image: "hotpotato")
    
    static var previews: some View {
        ChooseMusicView(game: cat)
    }
}
