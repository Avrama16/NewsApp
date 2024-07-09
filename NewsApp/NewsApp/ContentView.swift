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
        ArticleListView(articles: Article.previewData)
    }
}
    
    
    #Preview {
        ArticleListView(articles: Article.previewData)
    }

