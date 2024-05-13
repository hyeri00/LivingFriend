//
//  IconImages.swift
//  LivingFriend
//
//  Created by 혜리 on 5/14/24.
//

import UIKit

enum IconImages {
    case search
    
    var image: UIImage? {
        switch self {
        case .search:
            return UIImage(named: "icon_search")
        }
    }
}
