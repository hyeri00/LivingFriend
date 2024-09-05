//
//  ManageWholeCoordinator.swift
//  LivingFriend
//
//  Created by 혜리 on 9/3/24.
//

import UIKit

final class ManageWholeCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let manageWholeViewController = ManageWholeViewController()
        manageWholeViewController.coordinator = self
        self.navigationController.pushViewController(manageWholeViewController, animated: false)
    }
    
    func showPrevious() {
        self.navigationController.popViewController(animated: true)
    }
}
