//
//  HomeCoordinator.swift
//  LivingFriend
//
//  Created by 혜리 on 8/18/24.
//

import UIKit

final class HomeCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController()
        homeViewController.coordinator = self
        self.navigationController.pushViewController(homeViewController, animated: false)
    }
    
    func showCategory() {
        let categoryCoordinator = CategoryCoordinator(
            navigationController: self.navigationController
        )
        categoryCoordinator.start()
    }
}
