//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by A-Avramenko on 07.07.2024.
//

import SwiftUI

@main
struct NewsAppApp: App {
    let persistenceController = PersistenceController.shared
    
    @StateObject var articleBookmarkVM = ArticleBookmarkViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(articleBookmarkVM)
        }
    }
}
