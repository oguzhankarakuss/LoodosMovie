//
//  Helper.swift
//  LoodosMovie
//
//  Created by Oğuzhan Karakuş on 6.07.2019.
//  Copyright © 2019 Oğuzhan Karakuş. All rights reserved.
//

import Foundation

class Helper {
    
    public static func makeUrl(path: String, queryItems: [String: String]) -> URL{
        
        let server_url = Constants.BASE_URL
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = server_url
        urlComponents.path = path
        urlComponents.setQueryItems(with: queryItems)
        
        return urlComponents.url!
    }
    
}
extension URLComponents {
    
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
