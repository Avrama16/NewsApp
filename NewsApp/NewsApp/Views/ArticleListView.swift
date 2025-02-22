//
//  ArticleListView.swift
//  NewsApp
//
//  Created by A-Avramenko on 09.07.2024.
//

import SwiftUI

struct ArticleListView: View {
    
    let articles: [Article]
    
    @State private var selectedArticle: Article?
    
    var body: some View {
        List {
            ForEach(articles .filter({ $0.author != nil })) { article in
                ArticleRowView(article: article)
                    .onTapGesture {
                        selectedArticle = article
                    }
            }
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .sheet(item: $selectedArticle) {
            SafariView(url: $0.articleURL)
                .edgesIgnoringSafeArea(.all)
        }
    }
}
struct ArticleListView_Previews: PreviewProvider {
    
    @StateObject static var articleBookmarkVM = ArticleBookmarkViewModel.shared
    
    static var previews: some View {
        NavigationView {
            ArticleListView(articles: Article.previewData)
                .environmentObject(articleBookmarkVM)
        }
    }
}
