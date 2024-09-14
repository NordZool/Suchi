//
//  ContentView.swift
//  Sushi
//
//  Created by nikita on 9.09.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VerticalGridView(label: .init("Test", systemImage: "pen")) {
            ForEach(["Test", "Testing","some"], id: \.self) {item in
                SushiView(menuItem: .init(id: "2", imageLink: "/upload/iblock/368/zx0dxzelbg3vxohbdmuorr107kt3tna6.jpg", name: "Магура спайси", content: "sublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabelsublabel", price: "1200", weight: "5000 г", spicy: true)) {
                    //
                }
                SushiView(menuItem: .init(id: "2", imageLink: "/upload/iblock/368/zx0dxzelbg3vxohbdmuorr107kt3tna6.jpg", name: "Label", content: "Тунец", price: "100", weight: "50 г", spicy: true)) {
                    //
                }
            }
        }
//            .onAppear {
//                print("Test")
//                let task = URLSession.shared.dataTask(with: .init(url: .init(string: "https://vkus-sovet.ru/api/getSubMenu.php?menuID=29")!)) {data,response,error in
//                    print(data)
//                    print(response)
//                }
//                task.resume()
//            }
    }
}

#Preview {
    ContentView()
}
