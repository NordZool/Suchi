//
//  VerticalGridView.swift
//  Sushi
//
//  Created by nikita on 10.09.24.
//

import SwiftUI

struct VerticalGridView<Content, Title, Icon> : View
where
Content : View,
Title : View,
Icon : View
{
    //MARK: - Private properties
    private let colums: [GridItem]
    private let content: () -> Content
    private let spacing: CGFloat
    private let horizontalPadding: CGFloat
    private let label: Label<Title, Icon>
    init(
        colums: [GridItem] = [
            GridItem(.flexible(minimum: 50), spacing: 15, alignment: .center),
            GridItem(.flexible(minimum: 50), spacing: 15, alignment: .center)],
        label: Label<Title, Icon>,
        spacing:CGFloat = 20,
        horizontalPadding: CGFloat = 15,
        @ViewBuilder content: @escaping ()->Content) {
            self.colums = colums
            self.content = content
            self.spacing = spacing
            self.horizontalPadding = horizontalPadding
            self.label = label
        }
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: colums,
                alignment: .leading,
                spacing: spacing) {
                    content()
                }
                .padding(.horizontal, horizontalPadding)
        }
    }
}

#Preview {
    VerticalGridView(label: .init("Test", systemImage: "pen")) {
        ForEach(["Test", "Testing","some"], id: \.self) {item in
            SushiView(menuItem: .init(id: "2", image: "/upload/iblock/368/zx0dxzelbg3vxohbdmuorr107kt3tna6.jpg", name: "Магура спайси", content: "sublabel", price: "12200", weight: "50 г", spicy: "Y")) {
                //
            }
            SushiView(menuItem: .init(id: "2", image: "/upload/iblock/368/zx0dxzelbg3vxohbdmuorr107kt3tna6.jpg", name: "Label", content: "sublabel", price: "100", weight: "50 г", spicy: "Y")) {
                //
            }
        }
    }
    
    .background(Color(.systemGray))
    
}
