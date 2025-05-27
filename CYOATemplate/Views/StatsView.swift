//
//  StatsView.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2024-06-02.
//

import SwiftUI

struct StatsView: View {
    
    // MARK: Stored properties
    
    // Whether this view is showing in the sheet right now
    @Binding var showing: Bool
    // Tracks overall state as the reader reads the book
    @Bindable private var book = BookStore()
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            VStack {
                Text("You are on page \(book.currentPageId ?? 0) out of 81 pages overall in this story.")
            }
            .padding()
            .navigationTitle("Statistics")
            // Toolbar to show buttons for various actions
            .toolbar {
                
                // Hide this view
                ToolbarItem(placement: .automatic) {
                    Button {
                        showing = false
                    } label: {
                        Text("Done")
                            .bold()
                    }

                }
            }
        }
    }
    
}

#Preview {
    StatsView(showing: Binding.constant(true))
}
