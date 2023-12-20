//
//  TodoController.swift
//  SwiftUITodoWalkthrough
//
//  Created by Tyler May on 12/18/23.
//

import Foundation

class TodoController: ObservableObject {
    static let shared = TodoController()
    
    @Published var todoSections = [TodoSection]()
}
