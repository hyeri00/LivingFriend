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
        
        self.setNavigationBar()
    }
    
    private func setNavigationBar() {
        let image = IconImages.back.image?.withTintColor(.black, renderingMode: .alwaysOriginal)
        
        let titleLabel = UILabel()
        titleLabel.text = TextManager.period_title
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
        self.dismiss(animated: true)
    }
}
