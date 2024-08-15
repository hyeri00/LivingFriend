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
        
        self.addConfigure()
        self.setNavigationBar()
    }
    
    private func addConfigure() {
        self.periodView.didConfirmTapAction = {
            
            ToastMessage().showToast(image: IconImages.check.image, message: "등록 완료!")
            
            DispatchQueue.main.async {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                      let window = windowScene.windows.first(where: { $0.isKeyWindow }),
                      let tabBarController = window.rootViewController as? UITabBarController else { return }

                tabBarController.selectedIndex = 0
                tabBarController.presentedViewController?.dismiss(animated: true)
            }
        }
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
        self.navigationController?.popViewController(animated: true)
    }
}
