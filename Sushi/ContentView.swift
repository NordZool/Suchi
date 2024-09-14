//
//  ContentView.swift
//  Sushi
//
//  Created by nikita on 9.09.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VerticalGridView(label: Label(
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
        .background(.gray)
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
