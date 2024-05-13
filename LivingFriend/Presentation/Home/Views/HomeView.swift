//
//  HomeView.swift
//  LivingFriend
//
//  Created by 혜리 on 5/10/24.
//

import UIKit
import FSCalendar
import SnapKit

final class HomeView: UIView {
    
    // MARK: - Metric
    
    private enum Metric {
        static let calendarTopMargin: CGFloat = 50
        static let searchButtonTopMargin: CGFloat = 32
        static let searchButtonTrailingMargin: CGFloat = 25
        static let searchButtonSize: CGFloat = 17
        static let plusButtonBottomMargin: CGFloat = 50
        static let plusButtonTrailingMargin: CGFloat = 20
        static let plusButtonSize: CGFloat = 48
    }
    
    // MARK: - UI
    
    private lazy var calendar: FSCalendar = {
        let calendar = FSCalendar(frame: .zero)
        calendar.backgroundColor = .white
        
        calendar.locale = Locale(identifier: "ko_KR")
        calendar.placeholderType = .none
        
        // header
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.appearance.headerDateFormat = "YYYY년 MM월"
        calendar.appearance.headerTitleFont = Font.Typography.bold18
        calendar.appearance.headerTitleColor = .black
        calendar.headerHeight = 68
        
        // week
        calendar.appearance.weekdayFont = Font.Typography.air14
        calendar.appearance.weekdayTextColor = .black
        
        calendar.appearance.titleFont = Font.Typography.air14
        
        calendar.appearance.selectionColor = .lightGray
        calendar.appearance.todayColor = .darkGray
        
        return calendar
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(IconImages.search.image, for: .normal)
        button.isHidden = true // TODO: - 기능 미구현
        return button
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(IconImages.plus.image, for: .normal)
        return button
    }()
    
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
        self.addSubview(self.calendar)
        self.calendar.addSubview(self.searchButton)
        self.addSubview(self.plusButton)
        
        self.calendar.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(-Metric.calendarTopMargin)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.45)
        }
        
        self.searchButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(Metric.searchButtonTopMargin)
            $0.trailing.equalToSuperview().inset(Metric.searchButtonTrailingMargin)
            $0.width.height.equalTo(Metric.searchButtonSize)
        }
        
        self.plusButton.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(Metric.plusButtonBottomMargin)
            $0.trailing.equalToSuperview().inset(Metric.plusButtonTrailingMargin)
            $0.width.height.equalTo(Metric.plusButtonSize)
        }
    }
}
