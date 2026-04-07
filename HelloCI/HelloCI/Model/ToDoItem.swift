//
//  ToDoItem.swift
//  HelloCI
//
//  Created by anshika kalra on 7/4/2026.
//

import Foundation

struct ToDoItem: Identifiable, Hashable {
    let id: UUID = UUID()
    let title: String
}
