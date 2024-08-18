//
//  ManageWholeTableViewCell.swift
//  LivingFriend
//
//  Created by 혜리 on 8/18/24.
//

import UIKit

final class ManageWholeTableViewCell: UITableViewCell {
    
    // MARK: - Metric
    
    private enum Metric {
        static let basePadding: CGFloat = 20
        static let setDateSpacing: CGFloat = 130
    }
    
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
    
    // MARK: - Bind
    
    func bind(
        title: String,
        setDate: String,
        date: String
    ) {
        self.titleLabel.text = title
        self.setDateLabel.text = setDate
        self.dateLabel.text = date
    }
    
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
        self.addSubview(self.setDateLabel)
        self.addSubview(self.dateLabel)
        
        self.titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(Metric.basePadding)
            $0.centerY.equalToSuperview()
        }
        
        self.setDateLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-Metric.setDateSpacing)
            $0.centerY.equalToSuperview()
        }
        
        self.dateLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(Metric.basePadding)
            $0.centerY.equalToSuperview()
        }
    }
}
