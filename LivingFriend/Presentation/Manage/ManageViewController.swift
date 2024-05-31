//
//  ManageViewController.swift
//  LivingFriend
//
//  Created by 혜리 on 5/30/24.
//

import UIKit

final class ManageViewController: UIViewController {
    
    // MARK: - Properties
    
    private let manageView = ManageView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        self.view = manageView
    }
}
