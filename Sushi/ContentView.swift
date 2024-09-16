//
//  ContentView.swift
//  Sushi
//
//  Created by nikita on 9.09.24.
//

import SwiftUI

struct ContentView: View {
    @State private var vtest = 10
    var body: some View {
        TabViewItemView(selectedMenuID: $vtest, menu: .init(menuID: 8, imageLink: "", name: "Tester", subMenuCount: 40))
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
