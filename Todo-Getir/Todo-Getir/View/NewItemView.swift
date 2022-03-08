//
//  NewItemView.swift
//  Todo-Getir
//
//  Created by Priyanka Tyagi on 08/03/22.
//

import SwiftUI

struct NewItemView: View {
    
    // Property
    // --------
       
    // Connection to the ViewModel (Todo)
    var todo: Todo
    
    // State variables
    // ---------------
    // new item title
    @State var newItemTitle = ""
    // new item color
    @State var newItemColor = "blue"
    
    // new item detail
    @State var newItemDetail = ""
    
    // Environment variables
    // ---------------------
    // variable for dissmission of modal sheet
    @Environment(\.presentationMode) var presentationMode
    
    
    // UI content and layout
    // ---------------------
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // Header
            HStack {
                Text("New task")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: {
                    let newItem = TodoItem(title: self.newItemTitle, colorName: self.newItemColor, detail: self.newItemDetail)
                    self.todo.addItem(newItem: newItem)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Apply")
                        .fontWeight(.medium)
                }
                .disabled(newItemTitle.count == 0)
            }
            .padding([.top, .horizontal])
                
            // Input
            TextField("New Task", text: $newItemTitle)
                .font(.system(size: 20))
                .padding(20)
                .background(Color(.systemGray5))
                .cornerRadius(20)
                                    .padding(.bottom)
            
            // Input
            TextField("Detail of Task", text: $newItemDetail)
                .font(.system(size: 20))
                .padding(20)
                .background(Color(.systemGray5))
                .cornerRadius(20)
                                    .padding(.bottom)
            
            Spacer()
            
            // Footer
            HStack {
                Spacer()
                Text("Swipe down to cancel")
                    .foregroundColor(.secondary)
                    .padding(.top)
                Spacer()
            }
        }
        .padding(25)
    }
}



struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(todo: Todo())
    }
}

