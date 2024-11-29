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
    
    
    var body: some View {
        NavigationView {
            VStack{
                TextEditor(text: $taskText)
                HStack{
                    Button("A") {
                        //action for changing colorTag to Black
                    }
                    .frame(width: 40, height: 30)
                    .background(Color.gray.opacity(0.3))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                  //  .padding()
                    
                    Button("A") {
                        //action for changing colorTag to Red
                    }
                    .frame(width: 40, height: 30)
                    .background(Color.gray.opacity(0.3))
                    .foregroundColor(.red)
                    .cornerRadius(10)
                  //  .padding()
                    Button("A") {
                        //action for changing colorTag to Green
                    }
                    .frame(width: 40, height: 30)
                    .background(Color.gray.opacity(0.3))
                    .foregroundColor(.green)
                    .cornerRadius(10)
                  //  .padding()
                    Button("A") {
                        //action for changing colorTag to Blue
                    }
                    .frame(width: 40, height: 30)
                    .background(Color.gray.opacity(0.3))
                    .foregroundColor(.blue)
                    .cornerRadius(10)
                   // .padding()
                    
                    Button("Save") {
                        //action for saving data
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
