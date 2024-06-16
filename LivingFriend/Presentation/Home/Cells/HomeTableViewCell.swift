//
//  HomeTableViewCell.swift
//  LivingFriend
//
//  Created by 혜리 on 6/15/24.
//

import UIKit

final class HomeTableViewCell: UITableViewCell {
    
    // MARK: - UI
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Font.Typography.air12
        return label
    }()
    
    private let periodLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Font.Typography.air10
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = Font.Typography.air10
        return label
    }()
}
