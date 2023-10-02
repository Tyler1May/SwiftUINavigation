//
//  TodoView.swift
//  SwiftUITodoWalkthrough
//
//  Created by Brayden Lemke on 10/2/23.
//

import SwiftUI

struct TodoView: View {
    @State var todoSections = TodoSection.dummySections
    var body: some View {
        VStack {
            HStack{
                Text("Todos").font(.title)
                    .padding(.leading, 25)
                Spacer()
            }
            .padding()
            .frame(height: 40)
            
            List {
                ForEach($todoSections) { $section in
                    Section(section.sectionTitle) {
                        ForEach($section.todos) { $todo in
                            TodoRowView(todo: $todo)
                        }
                    }
                }
            }.listStyle(.inset)
        }
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}
