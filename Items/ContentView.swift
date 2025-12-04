//
//  ContentView.swift
//  Items
//
//  Created by Martin Hrbáček on 04.12.2025.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isDarkOn") private var isDarkOn: Bool = false
    
    var body: some View {
        TabView {
            Tab("Men's clothing", systemImage: "figure.stand") {
                NavigationStack {
                    CategoryView(category: .men)
                }
            }
            
            Tab("Women's clothing", systemImage: "figure.stand.dress") {
                NavigationStack {
                    CategoryView(category: .women)
                }
            }
            
            Tab("Jewelery", systemImage: "sparkles") {
                NavigationStack {
                    CategoryView(category: .jewelery)
                }
            }
            
            Tab("Electronics", systemImage: "macbook.and.iphone") {
                NavigationStack {
                    CategoryView(category: .electronics)
                }
            }
        }
        .preferredColorScheme(isDarkOn ? .dark : .light)
        .tint(isDarkOn ? .white : .primary)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ContentView()
}
