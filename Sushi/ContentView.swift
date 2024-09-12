//
//  ContentView.swift
//  Sushi
//
//  Created by nikita on 9.09.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SushiView(menuItem: .init(id: "2", imageLink: "/upload/iblock/368/zx0dxzelbg3vxohbdmuorr107kt3tna6.jpg", name: "Label", content: "sublabel", price: "100", weight: "50 г", spicy: true)) {
            
        }
            .onAppear {
                print("Test")
                let task = URLSession.shared.dataTask(with: .init(url: .init(string: "https://vkus-sovet.ru/api/getSubMenu.php?menuID=29")!)) {data,response,error in
                    print(data)
                    print(response)
                }
                task.resume()
            }
    }
}

#Preview {
    ContentView()
}
