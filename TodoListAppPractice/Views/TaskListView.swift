//
//  ContentView.swift
//  TodoListAppPractice
//
//  Created by Ehsan Taghavi on 26.12.2023.
//

import SwiftUI
import CoreData

struct TaskListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder: DateHolder

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TaskItem.dueDate, ascending: true)],
        animation: .default)
    private var items: FetchedResults<TaskItem>

    var body: some View {
        NavigationView {
            VStack{
                DateScroller()
                    .padding()
                    .environmentObject(dateHolder)
                ZStack{
                    List {
                        ForEach(items) { item in
                            NavigationLink(destination: TaskEditView(passedTaskItem: item, initialDate: Date()).environmentObject(dateHolder)) {
                                TaskCell(passedTaskItem: item)
                                    .environmentObject(dateHolder)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            EditButton()
                        }
                        ToolbarItem {
                            
                        }
                    }
                    
                    FloatingButton().environmentObject(dateHolder)
                }
            }.navigationTitle("To Do List")
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            dateHolder.saveContext(viewContext)
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    TaskListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
