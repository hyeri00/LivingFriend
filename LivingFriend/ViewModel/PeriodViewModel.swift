//
//  PeriodViewModel.swift
//  LivingFriend
//
//  Created by 혜리 on 6/15/24.
//

import UIKit

import CoreData

class PeriodViewModel {
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    open func saveMyManage(categoryTitle: String, dateText: String, periodText: String) {
        
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "MyManageEntity", in: context) else {
            return
        }
        
        let object = NSManagedObject(entity: entity, insertInto: context)
        
        object.setValue(categoryTitle, forKey: "categoryTitle")
        object.setValue(dateText, forKey: "dateText")
        object.setValue(periodText, forKey: "periodText")
        
        do {
            try context.save()
        } catch {
            print("error: \(error)")
        }
    }
    
    open func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: Date())
    }
}
