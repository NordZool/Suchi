//
//  HorizontalScrollableTabView.swift
//  Sushi
//
//  Created by nikita on 16.09.24.
//

import SwiftUI

struct HorizontalScrollableTabView : View {
    @StateObject private var viewModel: MenuViewModel = .init()
    
    var body: some View {
        ScrollView {
            LazyHStack(spacing: 20) {
                ForEach(viewModel.menuList) {menu in
                    
                }
            }
        }
    }
}
