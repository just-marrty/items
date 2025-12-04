//
//  ItemView.swift
//  Items
//
//  Created by Martin Hrbáček on 04.12.2025.
//

import SwiftUI

struct ItemView: View {
    
    let item: Item
    
    var body: some View {
        ScrollView {
            //BodyView
            BodyView(item: item)
            
            Divider()
                .padding()
            
            // ImageView
            ImageView(item: item)
            
            Divider()
                .padding()
            
            // ItemStatsView
            ItemStatsView(item: item)
        }
        .navigationTitle(item.category.rawValue.capitalized)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackgroundVisibility(.visible, for: .navigationBar)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    let item = ItemService().itemsData[0]
    NavigationStack {
        ItemView(item: item)
    }
}
