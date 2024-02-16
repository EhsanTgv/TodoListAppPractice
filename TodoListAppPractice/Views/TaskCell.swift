//
//  TaskCell.swift
//  TodoListAppPractice
//
//  Created by Ehsan Taghavi on 2.02.2024.
//

import SwiftUI

struct TaskCell: View {
    @EnvironmentObject var dateHolder:DateHolder
    @ObservedObject var passedTaskItem:TaskItem
    
    var body: some View{
        CheckBoxView(passedTaskItem: passedTaskItem)
            .environmentObject(dateHolder)
        
        Text(passedTaskItem.name ?? "")
            .padding(.horizontal)
    }
}

struct TaskCell_Previews: PreviewProvider{
    static var previews: some View {
        TaskCell(passedTaskItem: TaskItem())
    }
}

