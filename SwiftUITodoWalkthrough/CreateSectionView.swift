//
//  CreateSectionView.swift
//  SwiftUITodoWalkthrough
//
//  Created by Tyler May on 12/18/23.
//

import Foundation
import SwiftUI

struct CreateSectionView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var todoSections: [TodoSection]
    @State var newSection = ""
    
    var body: some View {
        VStack {
            Text("Add Section")
                .font(.largeTitle)
                .fontWeight(.thin)
                .padding(.top)
            Spacer()
            TextField("Section", text: $newSection)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15).stroke(.gray, style: StrokeStyle(lineWidth: 0.2)))
                .padding()
            Spacer()
            Button {
                if !newSection.isEmpty {
                    let section = TodoSection(sectionTitle: newSection, todos: [])
                    todoSections.append(section)
                }
                
                dismiss()
            } label: {
                Text("Add")
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
    
}

struct CreateSectionView_Previews: PreviewProvider {
    static var previews: some View {
        CreateSectionView(todoSections: .constant(TodoSection.dummySections))
    }
}
