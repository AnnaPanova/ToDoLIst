//
//  ContentView.swift
//  ToDoListCoreDataSwiftUI
//
//  Created by Anna Panova on 16.11.24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject var viewModel = CoreDataViewMOdel()

    var body: some View {
        NavigationView {
            VStack {
                Button("Add the task") {
                   
                    // saving new entity
                    viewModel.addNewTask(text: "newTask", tag: "red")
                   
                }
                .frame(minWidth: 150, maxWidth: 60)
                .background(Color.gray.opacity(0.3).cornerRadius(10))
                .foregroundColor(.black.opacity(0.7))
                .shadow(radius: 10)
                .padding(.leading, 200)
               
                List {
                    ForEach(viewModel.fetchedEntities) { entity in
                        NavigationLink(destination: TaskView( passedTask: entity)) {
                            Text(entity.textOfTask ?? "No Tasks")
                                .foregroundColor(.colorFromTag(tag: entity.colorTag ?? "black"))
                        }
                       
                        }
                    
                }
                .onAppear(perform: viewModel.fetchTaskEntities)
                
                .listStyle(.plain)
                
                Spacer()
            }
            .navigationTitle("My TODO List")
            .padding()
         
        }
      
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
