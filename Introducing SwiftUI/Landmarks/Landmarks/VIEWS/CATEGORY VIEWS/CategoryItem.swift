//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Taylor on 7/1/24.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155.0, height: 155.0)
                .cornerRadius(5.0)
            
            HStack(spacing: 2.0) {
                if landmark.isFavorite {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                        .font(.caption)
                }
                
                Text(landmark.name)
                    .foregroundStyle(.black)
                    .font(.caption)
            }
        }
        .padding(.leading, 15)
    }
}

#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
