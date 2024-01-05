//
//  TaskEditView.swift
//  TodoListAppPractice
//
//  Created by Ehsan Taghavi on 26.12.2023.
//

import SwiftUI

struct TaskEditView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var selectedTaskItem: TaskItem?
    @State var name: String
    @State var desc: String
    @State var dueDate: Date
    @State var schedule: Bool
    
    init(passedTaskItem: TaskItem?, initialDate:Date){
        if let taskItem = passedTaskItem{
            _selectedTaskItem = State(initialValue: taskItem)
            _name = State(initialValue: taskItem.name ?? "")
            _desc = State(initialValue: taskItem.desc ?? "")
            _dueDate = State(initialValue: taskItem.dueDate ?? initialDate)
            _schedule = State(initialValue: false)
        } else{
            _name = State(initialValue: "")
            _desc = State(initialValue: "")
            _dueDate = State(initialValue: initialDate)
            _schedule = State(initialValue: false)
        }
    }
    
    var body: some View {
        Form{
            Section(header:Text("Task")){
                TextField("Task Name", text: $name)
                TextField("Desc", text: $desc)
            }
            
            Section(header: Text("Due Date")){
                Toggle("Schedule Time", isOn: $schedule)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: displayComps())
            }
            
            Section(){
                Button("Save", action: saveAction)
                    .font(.headline)
                    .frame(maxWidth: .infinity,alignment: .center)
            }
        }
    }
    
    func displayComps() -> DatePickerComponents {
        return schedule ? [.hourAndMinute, .date] : [.date]
    }
    
    func saveAction() {
        withAnimation{
            if selectedTaskItem == nil {
                selectedTaskItem = TaskItem(context: viewContext)
            }
            
            selectedTaskItem?.created = Date()
            selectedTaskItem?.name = name
            selectedTaskItem?.dueDate = dueDate
            selectedTaskItem?.scheduleTime = schedule
        }
    }
}

struct TaskEditView_Previews: PreviewProvider{
    static var previews: some View{
        TaskEditView(passedTaskItem: TaskItem(), initialDate: Date())
    }
}
