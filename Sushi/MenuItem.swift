//
//  menuItem.swift
//  Sushi
//
//  Created by nikita on 10.09.24.
//

import Foundation


struct MenuItem {
    let id: String
    let image: String
    let name: String
    let content: String
    let price : String
    //приходит с префиксом 'г', 'кг' и тд.
    let weight : String
    //Если острое, вернет 'Y', иначе nil
    let spicy : String?
}
