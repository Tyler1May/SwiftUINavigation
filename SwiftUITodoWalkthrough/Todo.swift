//
//  Todo.swift
//  RandomTeachingStuff
//
//  Created by Brayden Lemke on 9/12/23.
//

import Foundation

struct TodoSection: Identifiable {
    var id: UUID = UUID()
    var sectionTitle: String
    var todos: [Todo]
}

struct Todo: Identifiable {
    var id: UUID = UUID()
    var markedComplete: Bool
    var title: String
}

extension TodoSection {
    static var dummySections: [TodoSection] = [
        TodoSection(sectionTitle: "School", todos: [
            Todo(markedComplete: false, title: "Homework"),
            Todo(markedComplete: false, title: "Learn how to collaborate using git"),
            Todo(markedComplete: true, title: "Learn SwiftUI SubViews")
        ]),
        TodoSection(sectionTitle: "Fun", todos: [
            Todo(markedComplete: true, title: "Code"),
            Todo(markedComplete: true, title: "Sleep")
        ])
    ]
}

extension Todo {
    static var dummyTodos: [Todo] = [
        Todo(markedComplete: false, title: "Homework"),
        Todo(markedComplete: true, title: "Code"),
        Todo(markedComplete: true, title: "Sleep"),
        Todo(markedComplete: false, title: "Learn how to collaborate using git"),
        Todo(markedComplete: true, title: "Learn SwiftUI SubViews")
    ]
}
