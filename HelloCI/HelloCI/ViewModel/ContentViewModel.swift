//
//  ContentViewModel.swift
//  HelloCI
//
//  Created by anshika kalra on 7/4/2026.
//

import Combine

class ContentViewModel: ObservableObject {
    @Published var toDoItems: [ToDoItem] = []
    
    func addItem() {
        let newItem = ToDoItem(title: "New Item")
        toDoItems.append(newItem)
    }
}
