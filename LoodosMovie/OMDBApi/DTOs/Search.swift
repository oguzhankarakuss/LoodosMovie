//
//  Search.swift
//  LoodosMovie
//
//  Created by Oğuzhan Karakuş on 4.07.2019.
//  Copyright © 2019 Oğuzhan Karakuş. All rights reserved.
//

import Foundation

// MARK: - Search
public struct Search: Decodable {
   public let search: [SearchElement]
   public let totalResults, response: String
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - SearchElement
public struct SearchElement: Decodable {
    public let title, year, imdbID: String
     let type: TypeEnum
    public let poster: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

enum TypeEnum: String, Decodable {
    case movie = "movie"
    case series = "series"
}
