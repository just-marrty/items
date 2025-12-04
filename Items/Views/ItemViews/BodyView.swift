//
//  BodyView.swift
//  Items
//
//  Created by Martin Hrbáček on 04.12.2025.
//

import SwiftUI

struct BodyView: View {
    
    let item: Item
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 6) {
                Text("Name:")
                    .font(.system(size: 20))
                    .bold()
                Text("• \(item.title)")
                    .font(.system(size: 18))
                    .padding(.bottom)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("Category:")
                        .font(.system(size: 20))
                        .bold()
                    Text("• \(item.category.rawValue.capitalized)")
                        .font(.system(size: 18))
                        .padding(.bottom)
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("Description:")
                        .font(.system(size: 20))
                        .bold()
                    Text("• \(item.description)")
                        .font(.system(size: 18))
                }
            }
        }
        .padding()
    }
}

#Preview {
    let item = ItemService().itemsData[0]
    NavigationStack {
        BodyView(item: item)
    }
}
