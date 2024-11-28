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
    
    @Published var fetchedEntities: [TaskEntity] = []
    
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
        
        fetchTaskEntities()
    }
    
    
    // func for fetching data Entities
    
    func fetchTaskEntities() {
        
        let request = NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
        
        do {
          fetchedEntities = try conteiner.viewContext.fetch(request)
        } catch let error {
                print("Error during fetching data from CoreData: \(error.localizedDescription)")
        }
    }
    
    // func for saving data
    
    func saveChanges() {
        
        // 1. trying save changes
        do {
            try conteiner.viewContext.save()
        } catch let error {
            print("Error during saving data to CoreData: \(error)")
        }
        
        // 2. fetching updated data
        fetchTaskEntities()
    }
    
    // func for adding new Entity
    
    func addNewTask(text: String, tag: String) {
        let newEntity = TaskEntity(context: conteiner.viewContext)
        newEntity.textOfTask = text
        newEntity.colorTag = tag
        
    saveChanges()
        
    }
}
