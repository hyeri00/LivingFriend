//
//  ManageDetailCoordinator.swift
//  LivingFriend
//
//  Created by 혜리 on 8/31/24.
//

import UIKit

final class ManageDetailCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let manageDetailViewController = ManageDetailViewController()
        manageDetailViewController.coordinator = self
        self.navigationController.pushViewController(manageDetailViewController, animated: false)
    }
    
    func showPrevious() {
        self.navigationController.popViewController(animated: true)
    }
}
