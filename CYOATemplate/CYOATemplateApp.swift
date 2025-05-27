//
//  CYOATemplateApp.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2023-05-29.
//

import SwiftUI

@main
struct CYOATemplateApp: App {
    @StateObject private var bookStore = BookStore()
    
    var body: some Scene {
        WindowGroup {
            AppEntryView()
                .environmentObject(bookStore)
        }
    }
}
