//
//  ContentView.swift
//  Todo-Getir
//
//  Created by Priyanka Tyagi on 08/03/22.
//

import SwiftUI

struct ContentView: View {
    @State var todos = [
        TodoItem(title: "Study", detail: "Study in detail"),
        TodoItem(title: "Finish App", detail: "Finish app in detail"),
        TodoItem(title: "Do Yoga", detail: "Do Yoga in detail"),
        TodoItem(title: "Meditate", detail: "Meditate in detail"),
        TodoItem(title: "Workout", detail: "workout in detail"),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todos) { item in
                    HStack {
                        Image(systemName: item.isChecked ? "checkmark.circle" : "circle")
                        Text(item.title)
                        Spacer()
                    }
                    .background(Color(.systemBackground))
                    .onTapGesture {
                        if let matchingIndex = self.todos.firstIndex(where: { $0.id == item.id }) {
                            self.todos[matchingIndex].isChecked.toggle()
                        }
                    }
                }
                .onDelete(perform: deleteListItem)
                .onMove(perform: moveListItem)
            }
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("Checklist")
        }
    }
    
    func deleteListItem(whichElement: IndexSet) {
        todos.remove(atOffsets: whichElement)
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int) {
        todos.move(fromOffsets: whichElement, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
