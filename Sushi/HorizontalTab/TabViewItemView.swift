//
//  TabViewItem.swift
//  Sushi
//
//  Created by nikita on 16.09.24.
//

import SwiftUI

struct TabViewItemView: View {
    @State private var test = 10
    @Binding var selectedMenuID: Int
    private let menu: Menu
    init(selectedMenuID: Binding<Int>, menu: Menu) {
        self._selectedMenuID = selectedMenuID
        self.menu = menu
    }
    
    var body: some View {
        Button {
                selectedMenuID = menu.menuID
        } label: {
            VStack(spacing: 10) {
                Image("Image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                VStack(spacing: 10) {
                    Text(menu.name)
                        .font(.subheadline)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                    Text("\(menu.subMenuCount) товаров")
                        .font(.footnote)
                        .foregroundStyle(Color(uiColor: .systemGray5))
                }
                .minimumScaleFactor(0.9)
                
                .padding(.horizontal, 10)
                .padding(.bottom, 8)
            }
            .background(selectedMenuID == menu.menuID ? .blue : .gray)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    TabViewItemView(selectedMenuID: .init(get: {8}, set: {$0}), menu: .init(menuID: 10, imageLink: "", name: "Суши", subMenuCount: 10))
        .frame(width:120 ,height: 120)
}
