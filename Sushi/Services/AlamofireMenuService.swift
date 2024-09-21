//
//  AlamofireSerrvice.swift
//  Sushi
//
//  Created by nikita on 21.09.24.
//

import Foundation
import Alamofire


class AlamofireMenuService {
    //MARK: - Public properties
    static let shared: AlamofireMenuService = .init()
    //MARK: - Private properties
    private let basicURL: String = "https://vkus-sovet.ru/api"
    private let URLPostfix: String = ".php"
    
    //MARK: - Inits
    private init() {getMenus()}
    
    //MARK: - Public methods
    func getMenus() {
        let urlTest = configureURL(basicURL, with: ["getMenu"], postfix: URLPostfix)
        
        let test = AF.request(URL(string:"")!)
    }
    
    private func configureURL<S: Sequence>(
        _ basicURL: S.Element,
        with components: S,
        postfix: String? = nil) -> URL where S.Element == String
    {
        func configure(components: S) -> S.Element {
            var result: S.Element = ""
            for component in components {
                result += ("/" + component)
            }
            
            return result
        }
        let configuredComponents = configure(components: components)
        var url = basicURL + configuredComponents
        url += postfix ?? ""
        
        return URL(string: url)!
    }
}
