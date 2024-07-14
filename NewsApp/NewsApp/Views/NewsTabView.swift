//
//  NewsTabView.swift
//  NewsApp
//
//  Created by A-Avramenko on 12.07.2024.
//

import SwiftUI

struct NewsTabView: View {
    
    @StateObject var articleNewsVM = ArticleNewsViewModel()
    
    var body: some View {
        NavigationView{
            ArticleListView(articles: articles)
                .overlay(overlayView)
                .task(id: articleNewsVM.fetchTaskToken, loadTask)
            //☀️
                .refreshable(action: refreshTask)
                .navigationTitle(articleNewsVM.fetchTaskToken.categoty.text)
                .navigationBarItems(trailing: menu)
        }
    }
    
    @ViewBuilder
    
    private var overlayView: some View {
        
        switch articleNewsVM.phase {
        case .empty: ProgressView()
        case .success(let articles) where articles.isEmpty: EmptyPlaceholderView(text: "No Articles", image: nil)
        case .failure(let error): RetryView(text: error.localizedDescription, retryAction: refreshTask)
        default: EmptyView()
        }
    }
    
    private var articles: [Article] {
        if case let .success(articles) = articleNewsVM.phase {
            return articles
        } else {
            return []
        }
    }
    
    private func loadTask() async {
        await articleNewsVM.loadArticles()
    }
    private func refreshTask() {
        articleNewsVM.fetchTaskToken = FetchTaskToken(categoty: articleNewsVM.fetchTaskToken.categoty, token: Date())
    }
    
    private var menu: some View {
        Menu {
            Picker("Category", selection: $articleNewsVM.fetchTaskToken.categoty) {
                ForEach(Category.allCases) {
                    Text($0.text).tag($0)
                }
            }
        } label: {
            Image(systemName: "menucard")
                .imageScale(.large)
        }
    }
}


#Preview {

    NewsTabView(articleNewsVM: ArticleNewsViewModel(articles: Article.previewData))
}
