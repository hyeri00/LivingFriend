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
    
    private lazy var calendar: FSCalendar = {
        let calendar = FSCalendar(frame: .zero)
        calendar.backgroundColor = .white
        
        calendar.locale = Locale(identifier: "ko_KR")
        return calendar
    }()
    
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
