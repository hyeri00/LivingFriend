//
//  CategoryViewController.swift
//  LivingFriend
//
//  Created by 혜리 on 5/15/24.
//

import UIKit

final class CategoryViewController: UIViewController {
    
    // MARK: - Properties
    
    private let categoryView = CategoryView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        self.view = categoryView
    }
}
