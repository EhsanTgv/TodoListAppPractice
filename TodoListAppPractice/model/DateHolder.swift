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
    @Published var taskItems : [TaskItem] = []
    
    let calendar: Calendar = Calendar.current
    
    func moveData(_ days: Int,_ context: NSManagedObjectContext){
        date = calendar.date(byAdding: .day, value: days, to: date)!
        refreshTaskItems(context)
    }
    
    init(_ context: NSManagedObjectContext){
        refreshTaskItems(context)
    }
    
    func refreshTaskItems(_ context: NSManagedObjectContext){
        taskItems = fetchTaskItem(context)
    }
    
    func fetchTaskItem(_ context: NSManagedObjectContext) -> [TaskItem]{
        do{
            return try context.fetch(dailyTasksFetch()) as [TaskItem]
        }catch let error{
            fatalError("Unresolved error \(error)")
        }
    }
    
    func dailyTasksFetch() -> NSFetchRequest<TaskItem>{
        let request = TaskItem.fetchRequest()
        
        request.sortDescriptors = sorOrder()
        request.predicate = predicate()
        
        return request
    }
    
    private func sorOrder() -> [NSSortDescriptor] {
        let completedDateSort = NSSortDescriptor(keyPath: \TaskItem.completedDate, ascending: true)
        let timeSort = NSSortDescriptor(keyPath: \TaskItem.scheduleTime, ascending: true)
        let dueDateSort = NSSortDescriptor(keyPath: \TaskItem.dueDate, ascending: true)
        
        return [completedDateSort, timeSort, dueDateSort]
    }
    
    private func predicate() -> NSPredicate {
        let start = calendar.startOfDay(for: date)
        let end = calendar.date(byAdding: .day, value: 1, to: start)
        return NSPredicate(format: "dueDate >= %@ AND dueDate < %@", start as NSDate, end! as NSDate)
    }
    
    func saveContext(_ context: NSManagedObjectContext) {
        do {
            try context.save()
            refreshTaskItems(context)
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
