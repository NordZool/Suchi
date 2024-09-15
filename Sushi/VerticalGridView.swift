//
//  VerticalGridView.swift
//  Sushi
//
//  Created by nikita on 10.09.24.
//

import SwiftUI

public struct VerticalGridView<Content, Title, Icon> : View
where
Content : View,
Title : View,
Icon : View
{
    //MARK: - Private properties
    private let columItem: GridItem = GridItem(
        .flexible(minimum: 50),
        spacing: 15,
        alignment: .center)
    private let columsCount: Int
    private let content: () -> Content
    private let spacing: CGFloat
    private let horizontalPadding: CGFloat
    private let label: Label<Title, Icon>
    public init(
        columsCount: Int = 2,
        label: Label<Title, Icon>,
        spacing:CGFloat = 60,
        horizontalPadding: CGFloat = 15,
        @ViewBuilder content: @escaping ()->Content) {
            self.columsCount = columsCount
            self.content = content
            self.spacing = spacing
            self.horizontalPadding = horizontalPadding
            self.label = label
        }
    
    public var body: some View {
        ScrollView {
            LazyVStack(alignment:.leading) {
                label
                    .padding(.bottom, 15)
                LazyVGrid(
                    columns: .init(
                        repeating: columItem,
                        count: columsCount),
                    alignment: .leading,
                    spacing: spacing) {
                        content()
                    }
            }
            .padding(.horizontal, horizontalPadding)
        }
    }
}

#Preview {
    VerticalGridView(columsCount: 2,label: Label(
        title: {
            Text("Суши")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        },
        icon: {}
    )) {
        ForEach(MenuItem.testItems) {item in
            SushiView(menuItem: item) {
                //action
            }
        }
    }
    .background(Color(.systemGray))
    
}
