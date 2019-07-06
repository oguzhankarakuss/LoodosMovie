//
//  MovieDetailViewController.swift
//  LoodosMovie
//
//  Created by Oğuzhan Karakuş on 6.07.2019.
//  Copyright © 2019 Oğuzhan Karakuş. All rights reserved.
//

import UIKit

final class MovieDetailViewController: UIViewController{
    
    @IBOutlet var customView: MovieDetailView!
    var imdbID: String?
    var movie: Movie!
    var service = MoviesService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.setLoading(true)
        service.fetchMovieDetail{ [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let value):
                self.movie = value
                self.customView.updateMovieDetail(MovieDetailPresentation(movieDetail: self.movie))
            case .failure(let error):
                print(error)
            }
            self.customView.setLoading(false)
        }
        
    }
    
}
