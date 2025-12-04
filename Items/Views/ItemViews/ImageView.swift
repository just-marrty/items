//
//  ImageView.swift
//  Items
//
//  Created by Martin Hrbáček on 04.12.2025.
//

import SwiftUI

struct ImageView: View {
    
    let item: Item
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: item.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 30)
                    .frame(width: 250, height: 250)
            } placeholder: {
                ProgressView()
                Text("Loading image")
            }
            .frame(width: 250, height: 250)
        }
        .padding(.bottom, 5)
    }
}

#Preview {
    let item = ItemService().itemsData[0]
    NavigationStack {
        ImageView(item: item)
    }
}
