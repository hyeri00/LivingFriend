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
        
        self.addConfigure()
        self.setNavigationBar()
    }
    
    private func addConfigure() {
        self.manageView.didTapTableViewAction = { [weak self] in
            let manageDetailViewController = ManageDetailViewController()
            self?.navigationController?.pushViewController(manageDetailViewController, animated: true)
        }
    }
    
    private func setNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = TextManager.manageList_title
        titleLabel.font = Font.Typography.bold16
        titleLabel.textColor = .black
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
        
        self.navigationController?.navigationBar.barTintColor = .white
    }
}
