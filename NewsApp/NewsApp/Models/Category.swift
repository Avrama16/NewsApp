//
//  Category.swift
//  NewsApp
//
//  Created by A-Avramenko on 11.07.2024.
//

import Foundation

enum Category: String, CaseIterable {
    case general
    case technology
    case science
    case business
    case health
    case sport
    case entertainment
    
    var text: String {
        if self == .general {
            return "Top Headlines"
        }
        return rawValue.capitalized
    }
}

extension Category: Identifiable {
    var id: Self { self }
}
