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
}

