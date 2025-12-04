//
//  ItemStatsView.swift
//  Items
//
//  Created by Martin Hrbáček on 04.12.2025.
//

import SwiftUI

struct ItemStatsView: View {
    
    let item: Item
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text("Price:")
                    .font(.system(size: 18))
                    .bold()
                Text("\(item.price.formatted()) $")
            }
            
            HStack {
                Text("Rating:")
                    .font(.system(size: 18))
                    .bold()
                Text("\(item.rating.rate.formatted()) / 5")
            }
            
            HStack {
                Text("Count:")
                    .font(.system(size: 18))
                    .bold()
                Text("\(item.rating.count) pcs")
            }
        }
        .padding(.bottom, 50)
    }
}

#Preview {
    let item = ItemService().itemsData[0]
    NavigationStack {
        ItemStatsView(item: item)
    }
}
