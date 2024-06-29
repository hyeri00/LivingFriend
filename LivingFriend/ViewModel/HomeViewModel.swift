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
    var filteredObjects: [MyManageEntity] = []
    var recentObjects: [MyManageEntity] = []
    
    private var managedObjectContext: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    // MARK: - 모든 데이터 가져오기
    
    func fetchObjects(completion: @escaping () -> Void) {
        let fetchRequest: NSFetchRequest<MyManageEntity> = MyManageEntity.fetchRequest()
        
        do {
            fetchedObjects = try managedObjectContext.fetch(fetchRequest)
            completion()
        } catch {
            print("Failed to fetch objects: \(error)")
        }
    }
    
    // MARK: - 가장 최근 날짜의 객체 필터링
    
    func filterMostRecentObjects(_ objects: [MyManageEntity]) {
        var uniqueObjects = [String: MyManageEntity]()
        
        for object in objects {
            guard let title = object.categoryTitle else { continue }
            
            if let existingObject = uniqueObjects[title] {
                if let existingDate = existingObject.dateText, let newDate = object.dateText, newDate > existingDate {
                    uniqueObjects[title] = object
                }
            } else {
                uniqueObjects[title] = object
            }
        }
        
        self.recentObjects = Array(uniqueObjects.values)
    }
    
    // MARK: - 데이터 날짜별로 가져오기
    
    func getFilteredObject(for date: String, completion: @escaping () -> Void) {
        let fetchRequest: NSFetchRequest<MyManageEntity> = MyManageEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "dateText == %@", date)
        
        do {
            filteredObjects = try managedObjectContext.fetch(fetchRequest)
            completion()
        } catch {
            print("Failed to fetch objects: \(error)")
        }
    }
    
    // MARK: - 데이터 삭제하기
    
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
    
    // MARK: - 날짜 변환
    
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
