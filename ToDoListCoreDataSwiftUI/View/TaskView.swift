//
//  TaskView.swift
//  ToDoListCoreDataSwiftUI
//
//  Created by Anna Panova on 29.11.24.
//

import Foundation
import SwiftUI
import CoreData

struct TaskView: View {
    
    @StateObject var viewModel = CoreDataViewMOdel()

    @State var selectedTask: TaskEntity?
    
    @State var taskText: String
    @State var taskColor: String
    
    let colorsArray: [String] = ["black", "red", "green", "blue"]
        
    init(passedTask: TaskEntity?) {
        if let task = passedTask {
            _selectedTask = State(initialValue: task)
            _taskText = State(initialValue: task.textOfTask ?? "No text")
            _taskColor = State(initialValue: task.colorTag ?? "black")
        } else {
            _taskText = State(initialValue: "")
            _taskColor = State(initialValue: "black")
        }
    }

    // func for savingTask
    func saveTask() {
      
        guard taskText.count >= 1 else {return}
        
        if selectedTask != nil {
            selectedTask?.textOfTask = taskText
            selectedTask?.colorTag = taskColor
            viewModel.saveChanges()
            viewModel.fetchTaskEntities()
        } else {
            let newTask = TaskEntity(context: viewModel.conteiner.viewContext)
            newTask.textOfTask = taskText
            newTask.colorTag = taskColor
            selectedTask = newTask
            viewModel.saveChanges()
            viewModel.fetchTaskEntities()
        }
      
    }
  
    var body: some View {
        NavigationView {
            VStack{
               
                TextEditor(text: $taskText)
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow.opacity(0.8))
                    .foregroundColor(Color.colorFromTag(tag: taskColor))
                    .padding()
                
                HStack{
                    // buttons for changing colorTag to black/red/green/blue
                    ForEach(colorsArray, id: \.self) { color in
                        ButtonForChangingColor(buttonColor: color) {
                            taskColor = color
                        }
                    }
                  
                    // button for saving task
                    Button("Save") {
                       saveTask()
                    }
                    .frame(width: 120, height: 50)
                    .background(Color.gray.opacity(0.5))
                    .foregroundColor(Color.black)
                    .cornerRadius(10)
                    .padding()
                }
            }
          
        }
        
    }
}


