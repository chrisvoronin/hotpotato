//
//  CategoryItemView.swift
//  Hot Potato TV
//
//  Created by Chris Voronin on 2/17/23.
//

import SwiftUI

struct CategoryItemView: View {
    
    var category:GameCategory
    
    @Environment(\.isFocused) var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
          Image(category.image)
            // 1
            .resizable()
            // 2
            .renderingMode(.original)
            // 3
            .aspectRatio(contentMode: .fill)
            // 4
            .frame(width: 450, height: 255)
            // 1
            .clipped()
            // 2
            .cornerRadius(10)
            // 3
            .shadow(radius: 5)
          // 1
          VStack(alignment: .leading) {
            // 2
            Text(category.title)
              .foregroundColor(.primary)
              .font(.headline)
              .bold()
            // 3
            Text(category.subTitle)
              .font(.subheadline)
              .foregroundColor(.secondary)
              .multilineTextAlignment(.leading)
              .lineLimit(2)
              .frame(height: 80)
          }
        }
    }
}

struct CategoryItemView_Previews: PreviewProvider {
    
    static let cat = GameCategory(type: 1, title: "Test", subTitle: "SubTitle", image: "hotpotato")
    static var previews: some View {
        CategoryItemView(category: cat)
    }
}
