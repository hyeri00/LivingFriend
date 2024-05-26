//
//  ManageView.swift
//  LivingFriend
//
//  Created by 혜리 on 5/27/24.
//

import UIKit

final class ManageView: UIView {
    
    // MARK: - UI
    
    private let manageTableView: UITableView = {
        let view = UITableView()
        view.rowHeight = 52
        view.backgroundColor = .white
        view.separatorStyle = .none
        return view
    }()
}
