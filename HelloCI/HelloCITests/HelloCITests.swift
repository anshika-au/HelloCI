//
//  HelloCITests.swift
//  HelloCITests
//
//  Created by anshika kalra on 18/2/2026.
//

import Testing
@testable import HelloCI

struct HelloCITests {

    @Test func addItem() {
        let viewModel = ContentViewModel()
        #expect(viewModel.toDoItems.count == 0)
        viewModel.addItem()
        #expect(viewModel.toDoItems.count == 1)
    }

}
