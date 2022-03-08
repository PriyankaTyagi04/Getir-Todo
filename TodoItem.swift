//
//  TodoItem.swift
//  Todo-Getir
//
//  Created by Priyanka Tyagi on 08/03/22.
//

import Foundation
import SwiftUI

// Model
// Our data stores as such structures.
struct TodoItem: Identifiable, Codable {
    var id = UUID()
    var title: String
    var isDone: Bool = false
    var colorName: String = "teal"
    var detail: String
}

