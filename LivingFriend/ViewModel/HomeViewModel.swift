//
//  HomeViewModel.swift
//  LivingFriend
//
//  Created by 혜리 on 6/16/24.
//

import UIKit

import CoreData

class HomeViewModel {
    
    var fetchedObjects: [MyManageEntity] = []
    
    private var managedObjectContext: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func fetchObjects(completion: @escaping () -> Void) {
        let fetchRequest: NSFetchRequest<MyManageEntity> = MyManageEntity.fetchRequest()
        
        do {
            fetchedObjects = try managedObjectContext.fetch(fetchRequest)
            completion()
        } catch {
            print("Failed to fetch objects: \(error)")
        }
    }
    
    func deleteObject(at indexPath: IndexPath, completion: @escaping () -> Void) {
        let objectToDelete = fetchedObjects[indexPath.row]
        managedObjectContext.delete(objectToDelete)
        
        do {
            try managedObjectContext.save()
            fetchedObjects.remove(at: indexPath.row)
            completion()
        } catch {
            print("Failed to delete object: \(error)")
        }
    }
    
    func getObject(at indexPath: IndexPath) -> MyManageEntity {
        return fetchedObjects[indexPath.row]
    }
    
    func calculateDate(from dateText: String, withPeriod periodText: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let startDate = dateFormatter.date(from: dateText),
              let period = Int(periodText) else {
            return ""
        }
        
        if let calculatedDate = Calendar.current.date(byAdding: .day, value: period, to: startDate) {
            dateFormatter.dateFormat = "M월 d일"
            return dateFormatter.string(from: calculatedDate)
        } else {
            return ""
        }
    }
}
