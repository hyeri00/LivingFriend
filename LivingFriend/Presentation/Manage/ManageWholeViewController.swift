//
//  ManageWholeViewController.swift
//  LivingFriend
//
//  Created by 혜리 on 8/18/24.
//

import UIKit

final class ManageWholeViewController: UIViewController {
    
    // MARK: - Properties
    
    private let manageWholeView = ManageWholeView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        self.view = manageWholeView
    }
}
