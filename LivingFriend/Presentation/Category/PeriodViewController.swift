//
//  PeriodViewController.swift
//  LivingFriend
//
//  Created by 혜리 on 5/20/24.
//

import UIKit

final class PeriodViewController: UIViewController {
    
    // MARK: - Properties
    
    private let periodView = PeriodView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        self.view = periodView
    }
}
