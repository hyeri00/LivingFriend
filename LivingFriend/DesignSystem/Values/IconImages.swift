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
    
    case back
    case x
    
    case appliance
    case basin
    case shower
    case washDishes
    case washingMachine
    
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
            
        case .back:
            return UIImage(named: "icon_back")
        case .x:
            return UIImage(named: "icon_x")
            
        case .appliance:
            return UIImage(named: "icon_appliance")
        case .basin:
            return UIImage(named: "icon_basin")
        case .shower:
            return UIImage(named: "icon_shower-head")
        case .washDishes:
            return UIImage(named: "icon_washing-dishes")
        case .washingMachine:
            return UIImage(named: "icon_washing-machine")
        }
    }
}
