//
//  ContentView.swift
//  Sushi
//
//  Created by nikita on 9.09.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MenuTabView()
        .background(.gray)
        .onAppear(perform: {
            AlamofireMenuService.shared.getMenus()
        })
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
