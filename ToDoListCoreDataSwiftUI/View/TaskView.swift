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
    @State var taskText: String = ""
    @State var textColorVasChanged: String = "black"
    
    
    var body: some View {
        NavigationView {
            VStack{
                TextEditor(text: $taskText)
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow.opacity(0.8))
                    .foregroundColor(Color.colorFromTag(tag: textColorVasChanged))
                    .padding()
                HStack{
                    Button("A") {
                        //action for changing colorTag to Black
                        // change foreground color into a TextEditor
                    textColorVasChanged = "black"
                       
                        // change tagForColor inside of entity
                        
                    }
                    .frame(width: 40, height: 30)
                    .background(Color.gray.opacity(0.3))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                  //  .padding()
                    
                    Button("A") {
                        //action for changing colorTag to Red
                        textColorVasChanged = "red"
                    }
                    .frame(width: 40, height: 30)
                    .background(Color.gray.opacity(0.3))
                    .foregroundColor(.red)
                    .cornerRadius(10)
                  //  .padding()
                    Button("A") {
                        //action for changing colorTag to Green
                        textColorVasChanged = "green"
                    }
                    .frame(width: 40, height: 30)
                    .background(Color.gray.opacity(0.3))
                    .foregroundColor(.green)
                    .cornerRadius(10)
                  //  .padding()
                    Button("A") {
                        //action for changing colorTag to Blue
                        textColorVasChanged = "blue"
                    }
                    .frame(width: 40, height: 30)
                    .background(Color.gray.opacity(0.3))
                    .foregroundColor(.blue)
                    .cornerRadius(10)
                   // .padding()
                    
                    Button("Save") {
                        //action for saving data
                        guard taskText.count >= 1 else {return}
                        let newTask = TaskEntity(context: viewModel.conteiner.viewContext)
                        newTask.textOfTask = taskText
                        newTask.colorTag = textColorVasChanged
                        print("Trying to save")
                        viewModel.saveChanges()
                        print(viewModel.$fetchedEntities.first())
                        taskText = newTask.textOfTask ?? "bla-bla"
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


struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
