//
//  TodoView.swift
//  SwiftUITodoWalkthrough
//
//  Created by Brayden Lemke on 10/2/23.
//

import SwiftUI

struct TodoView: View {
    @ObservedObject private var controller = TodoController.shared
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack{
                    Text("Todos").font(.title)
                        .padding(.leading, 25)
                    Spacer()
                    NavigationLink {
                        CreateTodoView()
                    } label: {
                        Image(systemName: "plus")
                            .padding(.trailing, 25)
                            .font(.title.weight(.thin))
                    }
                }
                .padding()
                .frame(height: 40)
                
                List {
                    ForEach($controller.todoSections) { $section in
                        Section(section.sectionTitle) {
                            ForEach($section.todos) { $todo in
                                TodoRowView(todo: $todo)
                            }
                            .onDelete { offsets in
                                deleteTodo(at: offsets, from: section)
                            }
                        }
                    }
                }.listStyle(.inset)
            }.toolbar(.hidden)
        }
        .onAppear {
            controller.todoSections = TodoSection.dummySections
        }
    }
    
    func deleteTodo(at offsets: IndexSet, from section: TodoSection) {
        if let index = controller.todoSections.firstIndex(of: section) {
            controller.todoSections[index].todos.remove(atOffsets: offsets)
        }
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}
