//
//  ContentView.swift
//  HelloCI
//
//  Created by anshika kalra on 18/2/2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel
    var body: some View {
        NavigationStack {
            List(viewModel.toDoItems) { item in
                Text(item.title)
            }
            .navigationTitle("To do items")
            .toolbar {
                ToolbarItem {
                    Button {
                        viewModel.addItem()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
        }
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel())
}
