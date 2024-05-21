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
        self.categoryView.didTapColletionViewAction = { [weak self] in
            let categoryViewController = UINavigationController(rootViewController: PeriodViewController())
            categoryViewController.modalPresentationStyle = .overFullScreen
            categoryViewController.transitioningDelegate = self
            self?.present(categoryViewController, animated: true)
        }
    }
    
    private func setNavigationBar() {
        let image = IconImages.x.image?.withTintColor(.black, renderingMode: .alwaysOriginal)
        
        let titleLabel = UILabel()
        titleLabel.text = TextManager.manage_title
        titleLabel.font = Font.Typography.bold16
        titleLabel.textColor = .black
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
        
        self.navigationController?.navigationBar.barTintColor = .white
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: image, style: .done,
            target: self, action: #selector(showPrevious)
        )
    }
    
    @objc
    private func showPrevious() {
        self.dismiss(animated: true)
    }
}

// MARK: - UIViewControllerTransitioningDelegate

extension CategoryViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController,
        source: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        return PresentTransition()
    }
    
    func animationController(
        forDismissed dismissed: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        return DismissTransition()
    }
}
