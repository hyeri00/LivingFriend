//
//  ManageWholeTableViewCell.swift
//  LivingFriend
//
//  Created by 혜리 on 8/18/24.
//

import UIKit

final class ManageWholeTableViewCell: UITableViewCell {
    
    // MARK: - UI
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Font.Typography.air14
        return label
    }()
    
    private let setDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = Font.Typography.air12
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Font.Typography.air14
        return label
    }()
}
