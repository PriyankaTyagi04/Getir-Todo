//
//  TodoView.swift
//  Todo-Getir
//
//  Created by Priyanka Tyagi on 08/03/22.
//
import SwiftUI

struct TodoView: View {
    
    // Connection to the ViewModel (Todo)
    @EnvironmentObject var todo: Todo
    
    
    // UI content and layout
    // ---------------------
    
    var body: some View {
        NavigationView {
            ZStack {
                ListView()
                    .navigationBarTitle("Todo")
                
                NewItemButton()

            }
        }
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView().environmentObject(Todo())
    }
}
