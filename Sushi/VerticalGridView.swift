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
    private let label: Label<Title, Icon>
    init(
        colums: [GridItem] = [
            GridItem(.flexible(minimum: 50), alignment: .center),
            GridItem(.flexible(minimum: 50), alignment: .center)],
        label: Label<Title, Icon>,
        spacing:CGFloat = 20,
        @ViewBuilder content: @escaping ()->Content) {
            self.colums = colums
            self.content = content
            self.spacing = spacing
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
        }
        
        
    }
}

#Preview {
    VerticalGridView(label: .init("Test", systemImage: "pen")) {
        ForEach(["Test", "Testing","some"], id: \.self) {item in
            Text(item)
                .frame(maxWidth: .infinity)
                .background(.red)
        }
    }
}
