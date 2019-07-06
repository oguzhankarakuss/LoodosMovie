//
//  MovieListContracts.swift
//  LoodosMovie
//
//  Created by Oğuzhan Karakuş on 4.07.2019.
//  Copyright © 2019 Oğuzhan Karakuş. All rights reserved.
//

import Foundation

struct MoviePresentation {
    let title: String
    let detail: String
}

protocol MovieListViewProtocol {
    func updateMovieList(_ movieList: [MoviePresentation])
}
