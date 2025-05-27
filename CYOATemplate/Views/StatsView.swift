//
//  StatsView.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2024-06-02.
//

import SwiftUI
import Charts

struct StatsView: View {
    
    // MARK: Stored properties
    
    // Whether this view is showing in the sheet right now
    @Binding var showing: Bool
    // Tracks overall state as the reader reads the book
    @Bindable private var book = BookStore()
    
    let guys = ["Chris", "Luke", "Bobby"]
    let steps = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            VStack {

                Text("You are on page \(book.currentPageId ?? 0) out of 81 pages overall in this story.")

                Text("See the percentages of Lydia's relationships statuses to Chris, Luke and Bobby:")
                    .bold()
                
                Chart {
                           ForEach(guys.indices, id: \.self) { index in
                               BarMark(x: .value("Guys", guys[index]), y: .value("Relationship status", steps[index]))
                                       .foregroundStyle(by: .value("Day", guys[index]))
                                         .annotation {
                                         Text("\(steps[index])")
                                                       }
                              }
                       }

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
