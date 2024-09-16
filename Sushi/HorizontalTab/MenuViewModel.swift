//
//  MenuViewModel.swift
//  Sushi
//
//  Created by nikita on 16.09.24.
//

import Foundation


class MenuViewModel: ObservableObject {
    @Published var menuList: [Menu] = []
}
