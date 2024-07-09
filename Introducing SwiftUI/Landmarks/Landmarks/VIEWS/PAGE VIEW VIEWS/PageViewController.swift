//
//  PageViewController.swift
//  Landmarks
//
//  Created by Taylor on 7/9/24.
//

import Foundation
import SwiftUI
import UIKit

struct PageViewController<Page : View>: UIViewControllerRepresentable {
    
    /// An array of pages used to scroll between landmarks.
    var pages: [Page]
    
    /// Indicates the index of the current displayed page.
    @Binding var currentPage: Int
    
    
    // MARK: - UI VIEW CONTROLLER REPRESENTABLE
    typealias UIViewControllerType = UIPageViewController
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        let viewControllers = [context.coordinator.controllers[currentPage]]
        pageViewController.setViewControllers(viewControllers, direction: .forward, animated: true)
    }
    
    // MARK: - COORDINATOR
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
        var parent: PageViewController
        var controllers: [UIViewController] = []
        
        init(pageViewController: PageViewController) {
            self.parent = pageViewController
            self.controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        // MARK: UI PAGE VIEW CONTROLLER DATA SOURCE
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else { return nil }
            
            if index == 0 {
                return controllers.last
            } else {
                return controllers[index - 1]
            }
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else { return nil }
            
            if index + 1 == controllers.count {
                return controllers.first
            } else {
                return controllers[index + 1]
            }
        }
        
        // MARK: UI PAGE VIEW CONTROLLER DELEGATE
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed, let visibleViewController = pageViewController.viewControllers?.first, let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(pageViewController: self)
    }
}
