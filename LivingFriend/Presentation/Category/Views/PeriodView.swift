//
//  PeriodView.swift
//  LivingFriend
//
//  Created by 혜리 on 5/15/24.
//

import UIKit

final class PeriodView: UIView {
    
    // MARK: - UI
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.text = TextManager.period_number
        label.textColor = .black
        label.font = Font.Typography.bold18
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = TextManager.period_date
        label.textColor = .black
        label.font = Font.Typography.bold18
        return label
    }()
    
    private let upButton: UIButton = {
        let button = UIButton()
        button.setTitle(TextManager.period_up, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Font.Typography.bold16
        return button
    }()
    
    private let downButton: UIButton = {
        let button = UIButton()
        button.setTitle(TextManager.period_down, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Font.Typography.bold16
        return button
    }()
}