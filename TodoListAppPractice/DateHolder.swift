//
//  DateHolder.swift
//  TodoListAppPractice
//
//  Created by Ehsan Taghavi on 18.01.2024.
//

import Foundation
import CoreData

class DateHolder: ObservableObject{
    
    init(_ context: NSManagedObjectContext){
        
    }
    
    func saveContext(_ context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
