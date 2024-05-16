//
//  Typography.swift
//  LivingFriend
//
//  Created by 혜리 on 5/13/24.
//

import UIKit

enum Font: String {
    case bold = "Cafe24Ssurround"
    case air = "Cafe24SsurroundAir"
    
    struct Typography {
        
        static func setFont(font: Font, fontSize: CGFloat) -> UIFont? {
            return UIFont(name: font.rawValue, size: fontSize)
        }
        
        static let bold30 = setFont(font: .bold, fontSize: 30)
        static let air30 = setFont(font: .air, fontSize: 30)
        
        static let bold18 = setFont(font: .bold, fontSize: 18)
        static let air18 = setFont(font: .air, fontSize: 18)
        
        static let bold16 = setFont(font: .bold, fontSize: 16)
        static let air16 = setFont(font: .air, fontSize: 16)
        
        static let bold14 = setFont(font: .bold, fontSize: 14)
        static let air14 = setFont(font: .air, fontSize: 14)
    
        static let bold12 = setFont(font: .bold, fontSize: 12)
        static let air12 = setFont(font: .air, fontSize: 12)
        
        static let bold10 = setFont(font: .bold, fontSize: 10)
        static let air10 = setFont(font: .air, fontSize: 10)
    }
}
