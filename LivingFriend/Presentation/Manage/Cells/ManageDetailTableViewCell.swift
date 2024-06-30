//
//  ManageDetailTableViewCell.swift
//  LivingFriend
//
//  Created by 혜리 on 6/30/24.
//

import UIKit

final class ManageDetailTableViewCell: UITableViewCell {
    
    // MARK: - UI
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Font.Typography.air12
        return label
    }()
    
    private let setDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Font.Typography.air12
        return label
    }()
    
    private let deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(IconImages.delete.image, for: .normal)
        return button
    }()
}
