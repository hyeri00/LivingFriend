//
//  HomeTableViewCell.swift
//  LivingFriend
//
//  Created by 혜리 on 6/15/24.
//

import UIKit

final class HomeTableViewCell: UITableViewCell {
    
    // MARK: - Metric
    
    private enum Metric {
        static let titleTopMargin: CGFloat = 10
        static let leadingMargin: CGFloat = 24
        static let periodTopSpacing: CGFloat = 10
        static let periodBottomMargin: CGFloat = 5
    }
    
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
    
    // MARK: - Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Bind
    
    func bind(
        title: String,
        period: String,
        date: String
    ) {
        self.titleLabel.text = title
        self.periodLabel.text = period
        self.dateLabel.text = date
    }
    
    // MARK: - Configure
    
    private func configure() {
        self.backgroundColor = .white
        self.selectionStyle = .blue
        
        self.makeConstraints()
    }
    
    private func makeConstraints() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.periodLabel)
        self.addSubview(self.dateLabel)
        
        self.titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Metric.titleTopMargin)
            $0.leading.equalToSuperview().offset(Metric.leadingMargin)
        }
        
        self.periodLabel.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(Metric.periodTopSpacing)
            $0.leading.equalTo(self.titleLabel.snp.leading)
            $0.bottom.equalToSuperview().offset(-Metric.periodBottomMargin)
        }
        
        self.dateLabel.snp.makeConstraints {
            $0.top.equalTo(self.periodLabel.snp.top)
            $0.leading.equalTo(self.periodLabel.snp.trailing).offset(Metric.leadingMargin)
            $0.bottom.equalTo(self.periodLabel.snp.bottom)
        }
    }
}
