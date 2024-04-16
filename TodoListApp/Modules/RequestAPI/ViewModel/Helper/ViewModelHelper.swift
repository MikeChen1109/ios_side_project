//
//  ViewModelHelper.swift
//  TodoListApp
//
//  Created by 逸唐陳 on 2023/8/4.
//

import Foundation

enum EventState<T> {
    case loading
    case error(Error)
    case data(_ data: T)
}
