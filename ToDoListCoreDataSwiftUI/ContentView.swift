//
//  ContentView.swift
//  ToDoListCoreDataSwiftUI
//
//  Created by Anna Panova on 16.11.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Button("Add the task") {
                    // saving new entity
                }
                .frame(minWidth: 150, maxWidth: 60)
                .background(Color.gray.opacity(0.3).cornerRadius(10))
                .foregroundColor(.black.opacity(0.7))
                .shadow(radius: 10)
                .padding(.leading, 200)
               
                List {
                    // add ForEach with list of Entities
                }
                
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
