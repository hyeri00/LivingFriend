//
//  PeriodCoordinator.swift
//  LivingFriend
//
//  Created by 혜리 on 8/20/24.
//

import UIKit

final class PeriodCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let periodViewController = PeriodViewController()
        periodViewController.coordinator = self
        self.navigationController.pushViewController(periodViewController, animated: false)
    }
    
    func backHome() {
        // TODO: - Back Home
    }
}
