//
//  Coordinator.swift
//  LivingFriend
//
//  Created by 혜리 on 8/18/24.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}

final class AppCoordinator: Coordinator {
    
    var window: UIWindow?
    
    var navigationController: UINavigationController
    
    init(window: UIWindow?) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        let tabBarController = UITabBarController()
        
        let homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
        let manageCoordinator = ManageCoordinator(navigationController: UINavigationController())
        
        homeCoordinator.start()
        manageCoordinator.start()
        
        tabBarController.setViewControllers([homeCoordinator.navigationController, manageCoordinator.navigationController], animated: false)
        
        setUpTabBarItems(for: homeCoordinator.navigationController, with: IconImages.home.image)
        setUpTabBarItems(for: manageCoordinator.navigationController, with: IconImages.show.image)
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
    private func setUpTabBarItems(for navigationController: UINavigationController, with image: UIImage?) {
        let tabBarItem = UITabBarItem(
            title: "",
            image: image?.withTintColor(.lightGray, renderingMode: .alwaysOriginal),
            selectedImage: image?.withTintColor(.black, renderingMode: .alwaysOriginal)
        )
        navigationController.tabBarItem = tabBarItem
    }
}
