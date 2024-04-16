//
//  TodoDatasource.swift
//  TodoListApp
//
//  Created by 逸唐陳 on 2023/8/6.
//

import Foundation
import CoreData


class TodoDataSource {
    static let shared = TodoDataSource()

    private init() {}
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Todo")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    func getAllTodo() -> [Todo] {
        let request = NSFetchRequest<Todo>(entityName: "Todo")
        return persistentContainer.viewContext.performAndWait {
            do {
                let todos = try persistentContainer.viewContext.fetch(request)
                return todos
            } catch {
                return []
            }
        }
    }
    
    func add(title: String, message: String?, date: Date) throws {
        try persistentContainer.viewContext.performAndWait {
            do {
                let context = persistentContainer.viewContext
                let todo = Todo(context: context)
                todo.title = title
                todo.message = message
                todo.createDate = date
                context.insert(todo)
                try context.save()
            }catch(let error) {
                throw error
            }
        }
    }
    
    func delete(_ todo: Todo) throws {
        try persistentContainer.viewContext.performAndWait {
            do {
                let context = persistentContainer.viewContext
                context.delete(todo)
                try context.save()
            }catch(let error) {
                throw error
            }
        }
    }
    
    func update(_ todo: Todo) throws {
        try persistentContainer.viewContext.performAndWait {
            do {
                let context = persistentContainer.viewContext
                try context.save()
            }catch(let error) {
                throw error
            }
        }
    }
}
