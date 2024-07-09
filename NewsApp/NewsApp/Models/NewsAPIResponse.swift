//
//  NewsAPIResponse.swift
//  NewsApp
//
//  Created by A-Avramenko on 09.07.2024.
//

import Foundation

struct NewsAPIResponse: Decodable {
    
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    
    let code: String?
    let smessage: String?
    
}
