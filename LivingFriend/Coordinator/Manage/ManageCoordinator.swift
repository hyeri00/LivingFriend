//
//  ManageCoordinator.swift
//  LivingFriend
//
//  Created by 혜리 on 8/22/24.
//

import UIKit

final class ManageCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let manageViewController = ManageViewController()
        manageViewController.coordinator = self
        self.navigationController.pushViewController(manageViewController, animated: false)
    }
    
    func showDetail() {
        // TODO: - Show Detail
    }
}
