//
//  ContentView.swift
//  NewsApp
//
//  Created by A-Avramenko on 07.07.2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        TabView {
            NewsTabView()
                .tabItem {
                    Label("News", systemImage: "newspaper.fill")
            }
        }
    }
}
    
    
    #Preview {
        ArticleListView(articles: Article.previewData)
    }

