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
                NavigationLink(destination: TaskView(passedTask: nil)) {
    
                    Text("Add the task")
                    .frame(minWidth: 150, maxWidth: 60)
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                    // shadow for 3D-effect
                    .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y: 3)
                    .padding(.leading, 200)
                }

                List {
                    ForEach(viewModel.fetchedEntities) { entity in
                        NavigationLink(destination: TaskView( passedTask: entity)) {
                            Text(entity.textOfTask ?? "No Tasks")
                                .foregroundColor(.colorFromTag(tag: entity.colorTag ?? "black"))
                        }
                       
                        }
                    .onDelete(perform: viewModel.deleteTask)
                    
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
