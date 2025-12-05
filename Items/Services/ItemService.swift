//
//  ItemService.swift
//  Items
//
//  Created by Martin Hrbáček on 04.12.2025.
//

import Foundation
import Observation

@Observable
class ItemService {
    var itemsData: [Item] = []
    var categoryData: [Item] = []
    
    init() {
        decodeItemsData()
    }
    
    func decodeItemsData() {
        if let url = Bundle.main.url(forResource: "items", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                categoryData = try decoder.decode([Item].self, from: data)
                itemsData = categoryData
            } catch {
                print("Cannot load the JSON file: \(error)")
            }
        }
    }
    
    func search(for searchTherm: String) -> [Item] {
        if searchTherm.isEmpty {
            return itemsData
        } else {
            return itemsData.filter { item in
                item.title.localizedCaseInsensitiveContains(searchTherm)
            }
        }
    }
    
    func filter(by category: ItemCategory) {
        itemsData = categoryData.filter { item in
            item.category == category
        }
    }
}
