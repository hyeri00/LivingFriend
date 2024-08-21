//
//  CategoryCoordinator.swift
//  LivingFriend
//
//  Created by 혜리 on 8/19/24.
//

import UIKit

final class CategoryCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let categoryViewController = CategoryViewController()
        categoryViewController.coordinator = self
        self.navigationController.pushViewController(categoryViewController, animated: false)
    }
    
    func showPeriod() {
        let periodCoordinator = PeriodCoordinator(
            navigationController: navigationController
        )
        periodCoordinator.start()
    }
}
