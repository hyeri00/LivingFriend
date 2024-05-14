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
        CategoryItem.item(id: 01, image: IconImages.appliance.image!, title: "정수기 필터"),
        CategoryItem.item(id: 02, image: IconImages.basin.image!, title: "세면대 필터"),
        CategoryItem.item(id: 03, image: IconImages.shower.image!, title: "샤워기 필터"),
        CategoryItem.item(id: 04, image: IconImages.washDishes.image!, title: "수세미 교체"),
        CategoryItem.item(id: 05, image: IconImages.washingMachine.image!, title: "세탁조 클리너")
    ]
    
//    mutating func addItem(image: UIImage, title: String) {
//        let newItem = CategoryItem.item(id: <#Int#>, image: image, title: title)
//        self.categoryData.append(newItem)
//    }
}
