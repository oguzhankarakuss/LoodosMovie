//
//  MovieListContracts.swift
//  LoodosMovie
//
//  Created by Oğuzhan Karakuş on 4.07.2019.
//  Copyright © 2019 Oğuzhan Karakuş. All rights reserved.
//

import Foundation

protocol MovieListViewProtocol {
    var delegate: MovieListViewDelegate? { get set }
    func updateMovieList(_ movieList: [MoviePresentation], totalResults: String, page: Int)
    func setLoading(_ isLoading: Bool)
}

protocol MovieListViewDelegate: class {
    func didSelectMovie(at movieTitle: String)
    func sendRequest(at searchName: String, page: Int)
    func didScroll(at isScroll: Bool)
}
