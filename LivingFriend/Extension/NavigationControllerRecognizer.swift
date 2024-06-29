//
//  NavigationControllerRecognizer.swift
//  LivingFriend
//
//  Created by 혜리 on 6/29/24.
//

import UIKit
import Foundation

extension UINavigationController: ObservableObject, UIGestureRecognizerDelegate {
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
