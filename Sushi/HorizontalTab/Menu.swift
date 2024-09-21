//
//  Menu.swift
//  Sushi
//
//  Created by nikita on 16.09.24.
//

import Foundation

struct Menu: Identifiable {
    var id: Int {
        menuID
    }
    
    var menuID: Int
    var imageLink: String
    var name: String
    var subMenuCount: Int
}

//MARK: - Codable
extension Menu : Codable {
    enum CodingKeys : String, CodingKey {
        case menuID
        case imageLink = "image"
        case name
        case subMenuCount
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let menuID = try container.decode(String.self, forKey: .menuID)
        self.menuID = Int(menuID) ?? 0
        self.imageLink = try container.decode(String.self, forKey: .imageLink)
        self.name = try container.decode(String.self, forKey: .name)
        self.subMenuCount = try container.decode(Int.self, forKey: .subMenuCount)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(String(menuID), forKey: .menuID)
        try container.encode(imageLink, forKey: .imageLink)
        try container.encode(name, forKey: .name)
        try container.encode(subMenuCount, forKey: .subMenuCount)
    }
}

//MARK: - Testable data
#if DEBUG
extension Menu {
    static let data: [Menu] = [
        .init(menuID: 0, imageLink: "Test", name: "Sushi", subMenuCount: 10),
        .init(menuID: 1, imageLink: "Test", name: "omar", subMenuCount: 56),
    ]
}
#endif
