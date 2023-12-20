//
//  CreateToDoView.swift
//  SwiftUITodoWalkthrough
//
//  Created by Tyler May on 12/18/23.
//

import SwiftUI

struct CreateTodoView: View {
    
    @ObservedObject private var controller = TodoController.shared
    
    @Environment(\.dismiss) var dismiss
    @State var newTodoText = ""
    @State private var selectedSection: TodoSection = .dummySections.first!
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Create New Todo")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .padding(.top)
                        .padding(.leading, 25)
                }
                Spacer()
                HStack {
                    TextField("Todo", text: $newTodoText)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15).stroke(.gray, style: StrokeStyle(lineWidth: 0.2)))
                        .padding()
                    Picker("For Section", selection: $selectedSection) {
                        ForEach(controller.todoSections) { section in
                            Text(section.sectionTitle).tag(section)
                        }
                    }
                    .padding(.trailing)
                }
                NavigationLink {
                    CreateSectionView(todoSections: $controller.todoSections)
                } label: {
                    Text("Add Section")
                        .padding(.top)
                        .padding(.trailing, 25)
                }
                Spacer()
                VStack {
                    Button {
                        if !newTodoText.isEmpty {
                            addNewTodo(newTodoText, for: selectedSection)
                            dismiss()
                        }
                    } label: {
                        Text("Create")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0))
                            .background(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)).fill(.blue))
                    }
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity)
                            .padding(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0))
                            .background(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)).stroke(.red))
                    }
                }
                .padding()
            }
            .onAppear {
                if controller.todoSections.count > 0 {
                    selectedSection = controller.todoSections[0]
                }
            }
        }
    }
        
    func addNewTodo(_ todoTitle: String, for section: TodoSection?) {
        if let sectionIndex = controller.todoSections.firstIndex(where: { $0 == section }) {
            controller.todoSections[sectionIndex].todos.append(Todo(markedComplete: false, title: todoTitle))
        }
    }
}

struct CreateTodoView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTodoView()
    }
}



