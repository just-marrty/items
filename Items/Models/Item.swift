//
//  Item.swift
//  Items
//
//  Created by Martin Hrbáček on 04.12.2025.
//

import Foundation

struct Item: Decodable, Identifiable, Hashable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: ItemCategory
    let image: String
    let rating: Rating
    
    struct Rating: Decodable, Hashable {
        let rate: Double
        let count: Int
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case description
        case category
        case image
        case rating
    }
}

enum ItemCategory: String, Decodable {
    case men = "men's clothing"
    case women = "women's clothing"
    case jewelery = "jewelery"
    case electronics = "electronics"
    
    var id: ItemCategory {
        self
    }
}
