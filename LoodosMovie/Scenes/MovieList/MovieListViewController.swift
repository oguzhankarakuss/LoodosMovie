//
//  MovieListViewController.swift
//  LoodosMovie
//
//  Created by Oğuzhan Karakuş on 4.07.2019.
//  Copyright © 2019 Oğuzhan Karakuş. All rights reserved.
//

import UIKit

final class MovieListViewController: UIViewController{
    
    @IBOutlet weak var customView: MovieListView!{
        didSet{
            customView.delegate = self
        }
    }
    var service: MoviesServiceProtocol!
    private var movieList: [SearchElement] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.setLoading(true)
        service.fetchMovies{ [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let value):
                self.movieList = value.search
                let moviePresentations = value.search.map(MoviePresentation.init)
                self.customView.updateMovieList(moviePresentations)
            case .failure(let error):
                print(error)
            }
            self.customView.setLoading(false)
        }
    }
    
}

extension MovieListViewController: MovieListViewDelegate{
    func didSelectMovie(at index: Int) {
        let id = movieList[index].imdbID
        let movieDetailViewController = MovieDetailBuilder.make(with: id)
        show(movieDetailViewController, sender: nil)
    }
}
