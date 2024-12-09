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
            print("CHANGED TASK: text: \(newTask.textOfTask ?? "no tesk text"), color: \(newTask.colorTag ?? "no color Tag ")")
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
                    Button("A") {
                        //action for changing colorTag to Black
                        // change foreground color into a TextEditor
                       textColorVasChanged = "black"
                        taskColor = "black"
                    }
                    .frame(width: 40, height: 30)
                    .background(Color.gray.opacity(0.3))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    
                    Button("A") {
                        //action for changing colorTag to Red
                        textColorVasChanged = "red"
                        taskColor = "red"
                    }
                    .frame(width: 40, height: 30)
                    .background(Color.gray.opacity(0.3))
                    .foregroundColor(.red)
                    .cornerRadius(10)
        
                    Button("A") {
                        //action for changing colorTag to Green
                        textColorVasChanged = "green"
                        taskColor = "green"
                    }
                    .frame(width: 40, height: 30)
                    .background(Color.gray.opacity(0.3))
                    .foregroundColor(.green)
                    .cornerRadius(10)
                
                    Button("A") {
                        //action for changing colorTag to Blue
                        textColorVasChanged = "blue"
                        taskColor = "blue"
                    }
                    .frame(width: 40, height: 30)
                    .background(Color.gray.opacity(0.3))
                    .foregroundColor(.blue)
                    .cornerRadius(10)
                  
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


