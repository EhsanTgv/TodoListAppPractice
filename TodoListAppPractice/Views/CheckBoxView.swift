//
//  CheckBoxView.swift
//  TodoListAppPractice
//
//  Created by Ehsan Taghavi on 16.02.2024.
//

import SwiftUI

struct CheckBoxView: View {
    
    @EnvironmentObject var dateHolder:DateHolder
    @ObservedObject var passedTaskItem:TaskItem
    
    var body: some View {
        Image(systemName: passedTaskItem.completedDate != nil ? "checkmark.circle.fill":"circle")
    }
}

struct CheckBoxView_Previews: PreviewProvider{
    static var previews: some View {
        CheckBoxView(passedTaskItem: TaskItem())
    }
}
