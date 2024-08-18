//
//  ManageWholeView.swift
//  LivingFriend
//
//  Created by 혜리 on 8/18/24.
//

import UIKit

final class ManageWholeView: UIView {
    
    // MARK: - UI
    
    private lazy var manageTableView: UITableView = {
        let view = UITableView()
        view.rowHeight = 52
        view.backgroundColor = .white
        view.separatorStyle = .none
        
        view.delegate = self
        view.dataSource = self
        view.register(ManageWholeTableViewCell.self,
                      forCellReuseIdentifier: "ManageWholeTableViewCell")
        return view
    }()
    
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    private func configure() {
        self.backgroundColor = .white
    }
    
    private func makeConstraints() {
        self.addSubview(self.manageTableView)
        
        self.manageTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
