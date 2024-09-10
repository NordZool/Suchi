//
//  SushiView.swift
//  Sushi
//
//  Created by nikita on 10.09.24.
//

import SwiftUI

struct SushiView: View {
    private let cartButtonAction: () -> Void
    private let menuItem: MenuItem
    
    init(
        menuItem: MenuItem,
        _ cartButtonAction: @escaping () -> Void) {
            self.menuItem = menuItem
            self.cartButtonAction = cartButtonAction
        }
    
    var body: some View {
        ZStack {
            VStack {
                Text(menuItem.name)
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 10)
                Text(menuItem.content)
                    .lineLimit(nil)
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .padding(.horizontal, 10)
                
                HStack {
                        Text("\(menuItem.price) ₽")
                            .foregroundStyle(.white)
                            .fontWeight(.medium)
                            .font(.title2)
                        Text("/ \(menuItem.weight)")
                            .foregroundStyle(.gray)
                            .fontWeight(.bold)
                            .font(.footnote)
                    }
                    .padding(.horizontal,10)
                
                Image("Image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
        }
        
    }
}

#Preview {
    SushiView(menuItem: .init(id: "2", image: "/upload/iblock/368/zx0dxzelbg3vxohbdmuorr107kt3tna6.jpg", name: "Label", content: "sublabel", price: "100", weight: "50 г", spicy: "Y")) {
        //
    }
    
}
