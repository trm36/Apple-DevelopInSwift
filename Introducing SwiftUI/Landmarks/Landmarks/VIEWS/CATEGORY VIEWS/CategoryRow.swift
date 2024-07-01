//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Taylor on 7/1/24.
//

import SwiftUI

struct CategoryRow: View {
    /// The category that is displayed on the row.
    var category: Landmark.Category
    
    /// The landmarks associated with category.
    var categoryLandmarks: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(category.rawValue)
                .font(.headline)
                .padding(.leading, 15.0)
                .padding(.top, 5.0)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0.0) {
                    ForEach(categoryLandmarks) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
                .padding(.trailing, 15.0)
            }
            .frame(height: 185.0)
        }
        .padding(.vertical, 10.0)
    }
}

#Preview {
    let landmarks = Array(ModelData().landmarks.prefix(4))
    let category = landmarks[0].category
    return CategoryRow(category: category, categoryLandmarks: landmarks)
}
