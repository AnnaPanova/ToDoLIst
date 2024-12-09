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
    @State var textColorVasChanged: String
    
    @State var selectedTask: TaskEntity?
    
    @State var taskText: String
    @State var taskColor: String
        
    init(passedTask: TaskEntity?) {
        if let task = passedTask {
            _selectedTask = State(initialValue: task)
            _taskText = State(initialValue: task.textOfTask ?? "No text")
            _taskColor = State(initialValue: task.colorTag ?? "black")
            _textColorVasChanged = State(initialValue: task.colorTag ?? "black")
        } else {
            _taskText = State(initialValue: "")
            _taskColor = State(initialValue: "black")
            _textColorVasChanged = State(initialValue: "black")
        }
    }

    // func for savingTask
    func saveTask() {
      
        guard taskText.count >= 1 else {return}
        
        if selectedTask != nil {
            selectedTask?.textOfTask = taskText
            selectedTask?.colorTag = taskColor
            print("Trying to save CHANGES task")
            viewModel.saveChanges()
            viewModel.fetchTaskEntities()
            print("CHANGED TASK: text: \(selectedTask!.textOfTask ?? "no tesk text"), color: \(selectedTask!.colorTag ?? "no color Tag ")")
        } else {
            let newTask = TaskEntity(context: viewModel.conteiner.viewContext)
            newTask.textOfTask = taskText
            newTask.colorTag = textColorVasChanged
            print("Trying to save NEW task")
            viewModel.saveChanges()
            viewModel.fetchTaskEntities()
            print("NEW TASK: text: \(newTask.textOfTask ?? "no tesk text"), color: \(newTask.colorTag ?? "no color Tag ")")
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
                    
                    // button for changing colorTag to black
                    ButtonForChangingColor(buttonColor: "black") {
                       textColorVasChanged = "black"
                        taskColor = "black"
                    }
                    
                    // button for changing colorTag to red
                    ButtonForChangingColor(buttonColor: "red") {
                       textColorVasChanged = "red"
                        taskColor = "red"
                    }
                    
                    // button for changing colorTag to green
                    ButtonForChangingColor(buttonColor: "green") {
                       textColorVasChanged = "green"
                        taskColor = "green"
                    }

                    // button for changing colorTag to blue
                    ButtonForChangingColor(buttonColor: "blue") {
                       textColorVasChanged = "blue"
                        taskColor = "blue"
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


