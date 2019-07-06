//
//  Movie.swift
//  LoodosMovie
//
//  Created by Oğuzhan Karakuş on 3.07.2019.
//  Copyright © 2019 Oğuzhan Karakuş. All rights reserved.
//

import Foundation

public struct Movie: Decodable{
    
    public let title: String
    public let released: String
    public let genre: String
    public let actors: String
    public let plot: String
    public let language: String
    public let country: String
    public let imdbRating: String
    public let director: String
    public let writer: String
    public let runtime: String
    public let image: URL
    
    public enum CodingKeys: String, CodingKey{
        case title = "Title"
        case released = "Released"
        case genre = "Genre"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case imdbRating
        case director = "Director"
        case writer = "Writer"
        case image = "Poster"
        case runtime = "Runtime"
    }
}
