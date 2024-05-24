//
//  CategoryData.swift
//  LivingFriend
//
//  Created by 혜리 on 5/15/24.
//

import UIKit

enum CategoryItem {
    case item(id: Int?, image: UIImage, title: String)
}

struct CategoryData {
    
    static let shared = CategoryData()
    
    var categoryData: [CategoryItem] = [
        CategoryItem.item(id: 01, image: IconImages.appliance.image!, title: TextManager.category_appliance),
        CategoryItem.item(id: 02, image: IconImages.basin.image!, title: TextManager.category_basin),
        CategoryItem.item(id: 03, image: IconImages.shower.image!, title: TextManager.category_shower),
        CategoryItem.item(id: 04, image: IconImages.washDishes.image!, title: TextManager.category_washDishes),
        CategoryItem.item(id: 05, image: IconImages.washingMachine.image!, title: TextManager.category_washingMachine),
        CategoryItem.item(id: 06, image: IconImages.sink.image!, title: TextManager.category_sink)
    ]
    
//    mutating func addItem(image: UIImage, title: String) {
//        let newItem = CategoryItem.item(id: <#Int#>, image: image, title: title)
//        self.categoryData.append(newItem)
//    }
}
