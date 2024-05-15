//
//  TaskFilter.swift
//  TodoListAppPractice
//
//  Created by Ehsan Taghavi on 15.05.2024.
//

import Foundation

enum TaskFilter: String {
    static var allFilters: [TaskFilter]{
        return [.NonCompleted,.Completed,.OverDue,.All]
    }
    
    case All = "All"
    case NonCompleted = "To Do"
    case Completed = "Completed"
    case OverDue = "Overdue"
}
