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
            ZStack {
                Image("hotpotato").resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                VStack() {
                    Text("Choose Game Type")
                        .font(.title).fontWeight(.bold).foregroundColor(.white)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top) {
                            ForEach(categories) { cat in
                                NavigationLink {
                                    ChooseMusicView(game: cat)
                                } label: {
                                    CategoryItemView(category: cat)
                                        .frame(maxWidth: 460)
                                        .cornerRadius(10)
                                        .padding()
                                }
                            }
                        }
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
