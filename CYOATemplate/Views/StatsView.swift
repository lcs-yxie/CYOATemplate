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
//    // Tracks overall state as the reader reads the book
//    @Bindable private var book = BookStore()
   
    
    // Access the book state through the environment
    @Environment(BookStore.self) var book
    let viewModel: PageViewModel
    
   
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            VStack {
                
                Text("You are on page \(book.currentPageId ?? 0) out of 82 pages overall in this story.")
                
//                Text("See the percentages of Lydia's relationships statuses to Chris, Luke and Bobby:")
//                    .bold()
                
                if let page = viewModel.page {
                    
                    let _ = print ("\(page.chris )")
                    let _ = print ("\(page.bobby )")
                    let _ = print ("\(page.luke )")
                          let guys = ["Chris", "Bobby", "Luke"]
                          let steps = [page.chris, page.bobby, page.luke]
                          
                          VStack {
                              Text("See the percentages of Lydia's relationships statuses to Chris, Luke and Bobby:")
                                  .font(.headline)
                              
                              Chart {
                                  ForEach(guys.indices, id: \.self) { index in
                                      BarMark(
                                          x: .value("Guys", guys[index]),
                                          y: .value("Relationship status", steps[index] )
                                      )
                                  }
                              }
                              .frame(height: 300)
                          }
                      } else {
                          Text("Loading data...")
                      }
                  }
            
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
    StatsView(
        showing: Binding.constant(true),
        viewModel: PageViewModel(book: BookStore())
    )
}
