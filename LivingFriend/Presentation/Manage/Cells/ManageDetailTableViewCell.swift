//
//  ManageDetailTableViewCell.swift
//  LivingFriend
//
//  Created by 혜리 on 6/30/24.
//

import UIKit

final class ManageDetailTableViewCell: UITableViewCell {
    
    // MARK: - Metric
    
    private enum Metric {
        static let baseMargin: CGFloat = 20
        static let setDateLeadingSpacing: CGFloat = 110
    }
    
    // MARK: - UI
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Font.Typography.air12
        return label
    }()
    
    private let setDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = Font.Typography.air12
        return label
    }()
    
    private let deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(IconImages.delete.image, for: .normal)
        return button
    }()
    
    // MARK: - Bind
    
    func bind(
        date: String,
        setDate: String
    ) {
        self.dateLabel.text = date
        self.setDateLabel.text = setDate
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
        
        self.makeConstraints()
    }
    
    private func makeConstraints() {
        self.addSubview(self.dateLabel)
        self.addSubview(self.setDateLabel)
        self.addSubview(self.deleteButton)
        
        self.dateLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(Metric.baseMargin)
            $0.centerY.equalToSuperview()
        }
        
        self.setDateLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(Metric.setDateLeadingSpacing)
            $0.centerY.equalToSuperview()
        }
        
        self.deleteButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-Metric.baseMargin)
            $0.centerY.equalToSuperview()
        }
    }
}
