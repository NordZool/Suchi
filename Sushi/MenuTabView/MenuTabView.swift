//
//  MenuTabView.swift
//  Sushi
//
//  Created by nikita on 18.09.24.
//

import SwiftUI

struct MenuTabView : View {
    @StateObject private var viewModel: MenuViewModel = .init()
    @State private var selectedMenuID: Int = 0
    
    var body: some View {
        ScrollView {
            LazyVStack {
                HorizontalScrollableTabBar(viewModel: viewModel, selectedMenuID: $selectedMenuID)
                ZStack {
                    ForEach(viewModel.menuList) {menu in
                        MenuItemsGridView()
                            .opacity(menu.id == selectedMenuID ? 1 : 0)
                    }
                }
                .padding(.bottom, 20)
            }
        }
    }
}
