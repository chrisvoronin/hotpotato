//
//  GameSelectionView.swift
//  Hot Potato TV
//
//  Created by Chris Voronin on 2/17/23.
//

import SwiftUI

struct GameSelectionView: View {
    
    var categories:[GameCategory] = [GameCategory(type: 1, title: "With Timer", subTitle: "Play with music stopping on random timer.", image: "hotpotato"),GameCategory(type: 2, title: "No Timer", subTitle: "Play with music that is paused ONLY via remote.", image: "hotpotato")]
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Image("hotpotato").resizable()
                        .aspectRatio(geometry.size, contentMode: .fill)
                        .edgesIgnoringSafeArea(.all).blur(radius: 10)
                        
                    VStack() {
                        Text("Choose Game Type")
                            .font(.title).fontWeight(.bold).foregroundColor(.white).padding(.top, 30)
                        List {
                            ForEach(categories) { cat in
                                NavigationLink {
                                    ChooseMusicView(game: cat).toolbarBackground(Color.white, for: .navigationBar)
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

struct GameSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GameSelectionView()
    }
}


struct GameCategory: Identifiable {
    var id = UUID()
    var type:Int
    var title: String
    var subTitle: String
    var image: String
    
}
