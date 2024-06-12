//
//  MyManageEntity+CoreDataProperties.swift
//  LivingFriend
//
//  Created by 혜리 on 6/12/24.
//
//

import Foundation
import CoreData


extension MyManageEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyManageEntity> {
        return NSFetchRequest<MyManageEntity>(entityName: "MyManageEntity")
    }

    @NSManaged public var categoryTitle: String?
    @NSManaged public var periodText: String?
    @NSManaged public var dateText: String?

}

extension MyManageEntity : Identifiable {

}
