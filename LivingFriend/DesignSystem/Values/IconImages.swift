//
//  IconImages.swift
//  LivingFriend
//
//  Created by 혜리 on 5/14/24.
//

import UIKit

enum IconImages {
    
    case home
    case show
    
    case search
    
    case plus
    
    var image: UIImage? {
        switch self {
        case .home:
            return UIImage(named: "icon_home")
        case .show:
            return UIImage(named: "icon_show")
        case .search:
            return UIImage(named: "icon_search")
        case .plus:
            return UIImage(named: "icon_plus")
        }
    }
}
