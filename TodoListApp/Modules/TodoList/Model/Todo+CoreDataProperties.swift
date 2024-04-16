//
//  Todo+CoreDataProperties.swift
//  TodoListApp
//
//  Created by 逸唐陳 on 2023/8/7.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var title: String?
    @NSManaged public var createDate: Date?
    @NSManaged public var message: String?
    @NSManaged public var isDone: Bool

}

extension Todo : Identifiable {

}
