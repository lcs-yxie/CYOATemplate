//
//  PagePicker.swift
//  CYOATemplate
//
//  Created by Yukun Xie on 2025/5/27.
//

import SwiftUI

struct PagePickerView: View {
    // Whether this view is showing in the sheet right now
    @Binding var showing: Bool
    
    // Access the book state through the environment
    @Environment(BookStore.self) var book
    
    // Default to current page
        @State private var selectedPageId: Int = 1
    
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Drop-down picker to choose a page
            Picker("Select a page", selection: $selectedPageId) {
                
                // Loop through all available pages (sorted by ID)
                ForEach(book.pages.keys.sorted(), id: \.self) { id in
                    Text("Page \(id)").tag(id)
                    
                }
            }
            .pickerStyle(.menu) // Show as a dropdown menu
            Button("Go") {
                book.read(selectedPageId) // Go to selected page
                showing = false           // Dismiss the picker view
            }
        }
    }
    
}
