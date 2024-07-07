//
//  ManageDetailViewController.swift
//  LivingFriend
//
//  Created by 혜리 on 6/30/24.
//

import UIKit

final class ManageDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private let manageDetailView = ManageDetailView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        self.view = manageDetailView
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
        self.view.backgroundColor = .white
    }
}

