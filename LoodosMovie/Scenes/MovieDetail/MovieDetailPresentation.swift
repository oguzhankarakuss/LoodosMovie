//
//  MovieDetailPresentation.swift
//  LoodosMovie
//
//  Created by Oğuzhan Karakuş on 6.07.2019.
//  Copyright © 2019 Oğuzhan Karakuş. All rights reserved.
//

import Foundation

struct MovieDetailPresentation {
    let title: String
    let released: String
    let genre: String
    let actors: String
    let plot: String
    let language: String
    let country: String
    let imdbRating: String
    let director: String
    let writer: String
    let runtime: String
    let image: URL
}

extension MovieDetailPresentation{
    init(movieDetail: Movie) {
        self.init(title: movieDetail.title, released: movieDetail.released, genre: movieDetail.genre, actors: movieDetail.actors, plot: movieDetail.plot, language: movieDetail.language, country: movieDetail.country, imdbRating: movieDetail.imdbRating, director: movieDetail.director, writer: movieDetail.writer, runtime: movieDetail.runtime, image: movieDetail.image)
    }
}
