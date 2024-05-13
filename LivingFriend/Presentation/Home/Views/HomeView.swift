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
        static let calendarTopMargin: CGFloat = 20
    }
    
    // MARK: - UI
    
    private lazy var calendar: FSCalendar = {
        let calendar = FSCalendar(frame: .zero)
        calendar.backgroundColor = .white
        
        calendar.locale = Locale(identifier: "ko_KR")
        return calendar
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
        
        self.calendar.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(Metric.calendarTopMargin)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.5)
        }
    }
}
