//
//  SushiGridView.swift
//  Sushi
//
//  Created by nikita on 18.09.24.
//

import SwiftUI

struct MenuItemsGridView: View {
    
    var body: some View {
        VerticalGridView(label: .init(
            title: {
                Text("Суши")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
            },
            icon: {}
        )) {
            ForEach(MenuItem.testItems) {item in
                MenuItemView(menuItem: item) {
                    //action
                }
            }
        }
    }
}
