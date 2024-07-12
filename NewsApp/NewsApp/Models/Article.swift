//
//  Article.swift
//  NewsApp
//
//  Created by A-Avramenko on 09.07.2024.
//

import Foundation

fileprivate let relativeDateFormatter = RelativeDateTimeFormatter()

struct Article {
    let source: Sourse
    let title: String
    let url: String
    let publishedAt: Date

    let author: String?
    let description: String?
    let urlToImage: String?

    var autorText: String {
        author ?? ""
    }
    var descriptionText: String {
        description ?? ""
    }

    var captionText: String {
        "\(source.name) · \(relativeDateFormatter.localizedString(for: publishedAt, relativeTo: Date()))"
    }


    var articleURL: URL {
        URL(string: url)!
    }
    var imageURL: URL? {
        guard let urlToImage = urlToImage else {
            return nil
        }
        return URL(string: urlToImage)
    }
}

extension Article: Codable {}
extension Article: Equatable {}
extension Article: Identifiable {
    var id: String { url }
}

extension Article {
    static var previewData: [Article] {
        let previewDataURL = Bundle.main.url(forResource: "news", withExtension: "json")!

        let data = try! Data(contentsOf: previewDataURL)

        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601

        let apiResponse = try!
        jsonDecoder.decode(NewsAPIResponse.self, from: data)
        return apiResponse.articles ?? []
    }
}

struct Sourse {
    let name: String
}

extension Sourse: Codable {}
extension Sourse: Equatable {}
