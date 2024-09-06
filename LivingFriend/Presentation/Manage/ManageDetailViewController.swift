//
//  ManageDetailViewController.swift
//  LivingFriend
//
//  Created by 혜리 on 6/30/24.
//

import UIKit

final class ManageDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    weak var coordinator: ManageDetailCoordinator?
    
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
        
        self.setNavigationBar()
    }
    
    private func setNavigationBar() {
        let image = IconImages.back.image?.withTintColor(.black, renderingMode: .alwaysOriginal)
        
        let titleLabel = UILabel()
        titleLabel.text = TextManager.manage_detail_title
        titleLabel.font = Font.Typography.bold16
        titleLabel.textColor = .black
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
        
        self.navigationController?.navigationBar.barTintColor = .white
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: image, style: .done,
            target: self, action: #selector(showPrevious)
        )
    }
    
    @objc
    private func showPrevious() {
        self.navigationController?.popViewController(animated: true)
    }
}

