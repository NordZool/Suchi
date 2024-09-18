//
//  SushiView.swift
//  Sushi
//
//  Created by nikita on 10.09.24.
//

import SwiftUI

struct MenuItemView: View {
    private let cartButtonAction: () -> Void
    private let menuItem: MenuItem
    private let cartButtonHeight: CGFloat = 45
    
    init(
        menuItem: MenuItem,
        _ cartButtonAction: @escaping () -> Void) {
            self.menuItem = menuItem
            self.cartButtonAction = cartButtonAction
        }
    
    var body: some View {
        ZStack(alignment: .bottom) {
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
                        .font(.system(size: 10))
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                        .frame(maxHeight: 60, alignment: .top)
                        .padding(.horizontal, 10)
                }
                VStack(spacing: 5) {
                    ZStack {
                        HStack(spacing:4) {
                            Text("\(menuItem.price) ₽")
                                .foregroundStyle(.white)
                                .fontWeight(.medium)
                                .font(.title3)
                                Rectangle()
                                    .frame(width: 1, height: 10)
                                    .foregroundStyle(.gray)
                                    .rotationEffect(.degrees(15))
                                Text(menuItem.weight)
                                    .foregroundStyle(.gray)
                                    .fontWeight(.bold)
                                    .font(.footnote)
                            
                        }
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                        .padding(.horizontal,30)
                        
                        HStack {
                            Spacer()
                            Image("chiliPiper")
                                .resizable()
                                .frame(width: 20, height: 25)
                        }
                        .padding(.trailing, 5)
                    }
                    
                    
                    Image(.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
            }
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.bottom, cartButtonHeight / 2)
            
            Button(action: cartButtonAction) {
                Text("В корзину")
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: cartButtonHeight)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.darkerBlue)
                    
            )
            .padding(.horizontal, 15)
            .buttonStyle(BorderedButtonStyle())
            
        }
    }
}

#Preview {
    MenuItemView(menuItem: .init(id: "2", imageLink: "/upload/iblock/368/zx0dxzelbg3vxohbdmuorr107kt3tna6.jpg", name: "Магура", content: "sublabel", price: "100", weight: "50 г", spicy: true)) {
        //
    }
    
}
