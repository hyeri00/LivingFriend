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
}
