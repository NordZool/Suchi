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
            VStack(spacing: 1) {
                VStack(spacing: 5) {
                    Text(menuItem.name)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                        .padding(.top, 8)
                    Text(menuItem.content)
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.8)
                        .font(.footnote)
                        .foregroundStyle(.gray)
                        .frame(maxHeight: 60, alignment: .top)
                        .padding(.horizontal, 10)
                }
                VStack(spacing: 5) {
                    HStack {
                        Text("\(menuItem.price) ₽")
                            .foregroundStyle(.white)
                            .fontWeight(.medium)
                            .font(.title3)
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
                
            }
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
        }
        
    }
}

#Preview {
    SushiView(menuItem: .init(id: "2", image: "/upload/iblock/368/zx0dxzelbg3vxohbdmuorr107kt3tna6.jpg", name: "Магура", content: "sublabel", price: "100", weight: "50 г", spicy: "Y")) {
        //
    }
    
}
