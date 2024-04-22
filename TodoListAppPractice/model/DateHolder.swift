//
//  DateHolder.swift
//  TodoListAppPractice
//
//  Created by Ehsan Taghavi on 18.01.2024.
//

import Foundation
import CoreData

class DateHolder: ObservableObject{
    
    @Published var date = Date()
    
    let calendar: Calendar = Calendar.current
    
    func moveData(_ days: Int,_ context: NSManagedObjectContext){
        date = calendar.date(byAdding: .day, value: days, to: date)!
    }
    
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
