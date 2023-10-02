//
//  TodoRowView.swift
//  RandomTeachingStuff
//
//  Created by Brayden Lemke on 9/12/23.
//

import SwiftUI

struct TodoRowView: View {
    @Binding var todo: Todo
    var body: some View {
        HStack {
            Button {
                todo.markedComplete.toggle()
            } label: {
                Circle().strokeBorder(.blue, lineWidth: 1).background(Circle().fill(todo.markedComplete ? .blue : .clear))
                    .frame(width: 20, height: 20)
            }
            Text(todo.title)
                .padding(.leading, 5)
            Spacer()
        }
        .padding()
        .frame(height: 40)
    }
}

struct TodoRowView_Previews: PreviewProvider {
    static var previews: some View {
        TodoRowView(todo: .constant(Todo(markedComplete: false, title: "My Todo"))).previewLayout(.sizeThatFits)
    }
}
