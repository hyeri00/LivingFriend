//
//  PeriodView.swift
//  LivingFriend
//
//  Created by 혜리 on 5/15/24.
//

import UIKit

final class PeriodView: UIView {
    
    // MARK: - Metric
    
    private enum Metric {
        static let basePadding: CGFloat = 30
        static let confirmButtonHeight: CGFloat = 48
    }
    
    // MARK: - UI
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.text = TextManager.period_number
        label.textColor = .black
        label.font = Font.Typography.bold30
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = TextManager.period_date
        label.textColor = .black
        label.font = Font.Typography.bold30
        return label
    }()
    
    private let upButton: UIButton = {
        let button = UIButton()
        button.setTitle(TextManager.period_up, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Font.Typography.bold30
        return button
    }()
    
    private let downButton: UIButton = {
        let button = UIButton()
        button.setTitle(TextManager.period_down, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Font.Typography.bold30
        return button
    }()
    
    private let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("설정 완료", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Font.Typography.air14
        button.layer.cornerRadius = 12
        button.backgroundColor = .black
        button.clipsToBounds = true
        return button
    }()
    
    // MARK: - Counter Logic
    
    private var number = 30 {
        didSet {
            numberLabel.text = "\(number)"
        }
    }
    
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
        self.addSubview(self.numberLabel)
        self.addSubview(self.dateLabel)
        self.addSubview(self.upButton)
        self.addSubview(self.downButton)
        self.addSubview(self.confirmButton)
        
        self.numberLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        self.dateLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.upButton.snp.trailing).offset(Metric.basePadding)
        }
        
        self.upButton.snp.makeConstraints {
            $0.bottom.equalTo(self.numberLabel.snp.top).offset(-Metric.basePadding)
            $0.centerX.equalToSuperview()
        }
        
        self.downButton.snp.makeConstraints {
            $0.top.equalTo(self.numberLabel.snp.bottom).offset(Metric.basePadding)
            $0.centerX.equalToSuperview()
        }
        
        self.confirmButton.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(Metric.basePadding)
            $0.leading.trailing.equalToSuperview().inset(Metric.basePadding)
            $0.height.equalTo(Metric.confirmButtonHeight)
        }
    }
}
