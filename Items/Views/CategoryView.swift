//
//  CategoryView.swift
//  Items
//
//  Created by Martin Hrbáček on 04.12.2025.
//

import SwiftUI

struct CategoryView: View {
    
    @AppStorage("isDarkOn") private var isDarkOn: Bool = false
    
    let category: ItemCategory
    @State private var itemService = ItemService()
    
    @State private var searchText: String = ""
    
    var filteredItems: [Item] {
        return itemService.search(for: searchText)
    }
    
    var body: some View {
        List(filteredItems) { item in
            NavigationLink(value: item) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(item.title)
                        .font(.system(size: 18))
                    
                    HStack {
                        Text("• Rating:")
                            .font(.system(size: 16))
                            .bold()
                        Text("\(item.rating.rate.formatted()) / 5")
                    }
                }
            }
        }
        .searchable(text: $searchText, prompt: "Search item")
        .listStyle(.plain)
        .animation(.default, value: searchText)
        
        .navigationTitle(category.rawValue.capitalized)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackgroundVisibility(.visible, for: .navigationBar)
        
        .navigationDestination(for: Item.self, destination: { item in
            ItemView(item: item)
        })
        
        .toolbarBackgroundVisibility(.visible, for: .tabBar)
        
        .navigationBarItems(trailing: Button(action: {
            isDarkOn.toggle()
        }, label: {
            Image(systemName: isDarkOn ?  "sun.max.fill" : "moon.fill")
                .font(.system(size: 20))
        }))
        
        .onAppear {
            itemService.filter(by: category)
        }
    }
}


#Preview {
    NavigationStack {
        CategoryView(category: .men)
    }
}
