//
//  TaskItemExtension.swift
//  TodoListAppPractice
//
//  Created by Ehsan Taghavi on 16.02.2024.
//

import Foundation

extension TaskItem {
    
    func isCompleted() -> Bool {
        return completedDate != nil
    }
    
}
