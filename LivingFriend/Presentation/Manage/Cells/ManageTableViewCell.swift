//
//  ManageTableViewCell.swift
//  LivingFriend
//
//  Created by 혜리 on 5/25/24.
//

import UIKit

final class ManageTableViewCell: UITableViewCell {
    
    // MARK: - Metric
    
    private enum Metric {
        static let basePadding: CGFloat = 20
    }

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
    
    // MARK: - Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    private func configure() {
        self.backgroundColor = .white
        self.selectionStyle = .none
        
        self.makeConstraints()
    }
    
    private func makeConstraints() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.manageLabel)
        self.addSubview(self.dateLabel)
        
        self.titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(Metric.basePadding)
            $0.centerY.equalToSuperview()
        }
        
        self.manageLabel.snp.makeConstraints {
            $0.trailing.equalTo(self.dateLabel.snp.leading).offset(-Metric.basePadding)
            $0.centerY.equalToSuperview()
        }
        
        self.dateLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-Metric.basePadding)
            $0.centerY.equalToSuperview()
        }
    }
}
