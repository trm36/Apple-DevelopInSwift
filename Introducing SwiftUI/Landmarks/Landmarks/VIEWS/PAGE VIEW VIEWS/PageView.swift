//
//  PageView.swift
//  Landmarks
//
//  Created by Taylor on 7/9/24.
//

import SwiftUI

struct PageView<Page : View>: View {
    /// An array of pages used to scroll between landmarks.
    var pages: [Page]
    
    /// Indicates the index of the current displayed page.
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
        .aspectRatio(3.0 / 2.0, contentMode: .fit)
    }
}

#Preview {
    PageView(pages: ModelData().featuredLandmarks.map { FeatureCard(landmark: $0) })
}
