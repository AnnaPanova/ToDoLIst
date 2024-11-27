//
//  CoreDataVievModel.swift
//  ToDoListCoreDataSwiftUI
//
//  Created by Anna Panova on 27.11.24.
//

import Foundation
import CoreData

class CoreDataViewMOdel: ObservableObject {
    let conteiner : NSPersistentContainer
    
    init() {
        conteiner = NSPersistentContainer(name: "TasksContainer")
        
        // loading data in container
            conteiner.loadPersistentStores(completionHandler: { NSEntityDescription, error in
                if let error = error {
                    print("Error during loading Core Data: \(error.localizedDescription)")
                } else {
                    print("Succes loading")
                }
            })
        
        
    }
    
    
    
}
