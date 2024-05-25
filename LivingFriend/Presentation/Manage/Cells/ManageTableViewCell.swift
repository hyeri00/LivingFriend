//
//  ManageTableViewCell.swift
//  LivingFriend
//
//  Created by 혜리 on 5/25/24.
//

import UIKit

final class ManageTableViewCell: UITableViewCell {
    
    // MARK: - UI
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Font.Typography.air14
        return label
    }()
    
    private let manageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = Font.Typography.air10
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Font.Typography.air14
        return label
    }()
}
