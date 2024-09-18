//
//  HorizontalScrollableTabView.swift
//  Sushi
//
//  Created by nikita on 16.09.24.
//

import SwiftUI

struct HorizontalScrollableTabBar : View {
    @ObservedObject var viewModel: MenuViewModel = .init()
    @Binding var selectedMenuID: Int
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(viewModel.menuList) {menu in
                    TabViewItemView(selectedMenuID: $selectedMenuID, menu: menu)
                        .frame(width:120 ,height: 120)
                }
            }
        }
        .frame(height: 150)
    }
}

#Preview {
    TabView {
        TabView {
            Text("Test")
            Text("Test")
            Text("Test")
            Text("Test")
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .tabItem { Label("Menu", systemImage: "list.dash") }
        
        Text("Another test")
            .tabItem { Label("Menu", systemImage: "list.dash") }
    }
}
