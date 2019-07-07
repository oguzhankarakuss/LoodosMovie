//
//  MovieListViewController.swift
//  LoodosMovie
//
//  Created by Oğuzhan Karakuş on 4.07.2019.
//  Copyright © 2019 Oğuzhan Karakuş. All rights reserved.
//

import UIKit
import RevealingSplashView

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
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        title = "Movie Search"
    }
    
}

extension MovieListViewController: MovieListViewDelegate{
    func didSelectMovie(at movieTitle: String) {
        let movieDetailViewController = MovieDetailBuilder.make(with: movieTitle)
        show(movieDetailViewController, sender: nil)
    }
    
    func sendRequest(at searchName: String, page: Int) {
        customView.setLoading(true)
        service.fetchMovies(searchName: searchName, page: page){ [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let value):
                self.movieList = value.search
                let moviePresentations = value.search.map(MoviePresentation.init)
                self.customView.updateMovieList(moviePresentations, totalResults: value.totalResults, page: page + 1)
            case .failure(let error):
                print(error)
                // TODO: Sonuç bulunamadı uyarısı verilecek
            }
            self.customView.setLoading(false)
            }
    }
}
