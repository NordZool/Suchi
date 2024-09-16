//
//  menuItem.swift
//  Sushi
//
//  Created by nikita on 10.09.24.
//

import Foundation


struct MenuItem : Identifiable {
    let id: String
    let imageLink: String
    let name: String
    let content: String
    let price : String
    //приходит с префиксом 'г', 'кг' и тд.
    let weight : String
    //Если острое, вернет 'Y', иначе nil
    let spicy : Bool
}
class Test {
    var test: MenuItem = .init(id: "Test", imageLink: "Lol", name: "da", content: "da", price: "13", weight: "353", spicy: true) {
        didSet {
            
        }
    }
}

//MARK: - Codable
extension MenuItem : Codable{
    enum CodingKeys: String, CodingKey {
        case id
        case imageLink = "image"
        case name
        case content
        case price
        case weight
        case spicy
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.imageLink = try container.decode(String.self, forKey: .imageLink)
        self.name = try container.decode(String.self, forKey: .name)
        self.content = try container.decode(String.self, forKey: .content)
        self.price = try container.decode(String.self, forKey: .price)
        self.weight = try container.decode(String.self, forKey: .weight)
        
        if let spicy = try container.decodeIfPresent(String.self, forKey: .spicy),
           spicy == "Y" {
            self.spicy = true
        } else {
            self.spicy = false
        }
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(imageLink, forKey: .imageLink)
        try container.encode(name, forKey: .name)
        try container.encode(content, forKey: .content)
        try container.encode(price, forKey: .price)
        try container.encode(weight, forKey: .weight)
        let spicyValue: String? = spicy ? "Y" : nil
        try container.encodeIfPresent(spicyValue, forKey: .spicy)
    }
}

#if DEBUG
extension MenuItem {
    static var testItems: [MenuItem] = [
        .init(
            id: "0",
            imageLink: "/upload/iblock/368/zx0dxzelbg3vxohbdmuorr107kt3tna6.jpg",
            name: "Магура спайси",
            content: "Тунец",
            price: "320",
            weight: "50 г",
            spicy: true),
        .init(
            id: "1",
            imageLink: "/upload/iblock/b9d/pvbuhueov2vhi3jvplw2fq57i5u88u5f.jpg",
            name: "Хит",
            content: "Эби Яки, Сяке кунсей, Тайланд, Унаги яки",
            price: "1 300",
            weight: "1200 г",
            spicy: false),
        .init(
            id: "2",
            imageLink: "/upload/iblock/b9d/pvbuhueov2vhi3jvplw2fq57i5u88u5f.jpg",
            name: "Сашими",
            content: "Эби Яки Тайланд, Унаги яки",
            price: "1 000",
            weight: "100 г",
            spicy: false),
    ]
}
#endif
