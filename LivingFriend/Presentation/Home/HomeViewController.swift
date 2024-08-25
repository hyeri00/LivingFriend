//
//  HomeViewController.swift
//  LivingFriend
//
//  Created by 혜리 on 5/13/24.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    weak var coordinator: HomeCoordinator?
    
    private let homeView = HomeView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        self.view = homeView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.homeView.refresh()
    }
    
    // MARK: - Initialize
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    private func configure() {
        
        self.addConfigure()
        self.setNavigationBar()
    }
    
    private func addConfigure() {
        self.homeView.didTapPlusButtonAction = { [weak self] in
            coordinator?.showCategory()
        }
    }
    
    private func setNavigationBar() {
        self.title = ""
    }
}
