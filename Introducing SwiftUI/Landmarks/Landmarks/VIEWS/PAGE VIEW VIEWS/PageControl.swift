//
//  PageControl.swift
//  Landmarks
//
//  Created by Taylor on 7/9/24.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {

    var numberOfPages: Int
    @Binding var currentPage: Int
    
    typealias UIViewType = UIPageControl
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        let selector = #selector(Coordinator.updateCurrentPage(sender:))
        control.addTarget(context.coordinator, action: selector, for: .valueChanged)
        return control
    }
    
    func updateUIView(_ pageControl: UIPageControl, context: Context) {
        pageControl.currentPage = currentPage
    }
    
    
    // MARK: - COORDINATOR
    class Coordinator: NSObject {
        var control: PageControl
        
        init(pageControl: PageControl) {
            self.control = pageControl
        }
        
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(pageControl: self)
    }
    
}
