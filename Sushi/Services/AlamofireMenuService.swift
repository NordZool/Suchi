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
    private init() {}
    
    //MARK: - Public methods
    func getMenuList(
        with components: [String] = ["getMenu"],
        complition: @escaping (Result<[Menu],AFError>) -> Void) {
        let url = configureURL(basicURL, with: components, postfix: URLPostfix)
            
            AF.request(url).responseDecodable(of: GetMenuListResponse.self) { response in
                let result = response.result
                switch result {
                case .success(let success):
                    let menuList = success.menuList
                    complition(.success(menuList))
                case .failure(let failure):
                    complition(.failure(failure))
                }
        }
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
    
    fileprivate struct GetMenuListResponse : Decodable {
        let status: Bool
        let menuList: [Menu]
    }
}
