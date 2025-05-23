//
//  CoverView.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2024-06-02.
//

import SwiftUI

struct CoverView: View {
    
    // MARK: Stored properties
    
    // MARK: Stored properties
    @Environment(BookStore.self) var book
    
    // MARK: Computed properties
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                gradient: Gradient(colors: [
                                    Color("grad").opacity(1),
                                    Color("grad").opacity(1),
                                    Color("grad").opacity(0.6)
                                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack {
                // Cover image with aspect ratio preserved
                Image("cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: .infinity)
                    .padding()

                if !book.isNotReadyToRead {
                    VStack(spacing: 20) {

                        Button {
                            withAnimation {
                                book.beginReading()
                            }
                        } label: {
                            Text("Begin reading")
                                .padding()
                                .background(Color.white.opacity(0.8))
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.bottom, 50)
                } else {
                    ProgressView()
                }
            }
        }
    }
}

#Preview {
    CoverView()
}
