//
//  MovieDetailViewController.swift
//  LoodosMovie
//
//  Created by Oğuzhan Karakuş on 6.07.2019.
//  Copyright © 2019 Oğuzhan Karakuş. All rights reserved.
//

import UIKit
import Firebase

final class MovieDetailViewController: UIViewController{
    
    @IBOutlet var customView: MovieDetailView!
    var movieTitle: String?
    var movie: Movie!
    var service = MoviesService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = movieTitle
        movieDetailRequest()

    }
    
    func movieDetailRequest(){
        customView.setLoading(true)
        service.fetchMovieDetail(movieTitle: movieTitle!){ [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let value):
                self.movie = value
                self.customView.updateMovieDetail(MovieDetailPresentation(movieDetail: self.movie))
                self.logMovieDetailFirebaseAnalystics()
            case .failure(let error):
                print(error)
            }
            self.customView.setLoading(false)
        }
    }
    
    func logMovieDetailFirebaseAnalystics(){
        Analytics.logEvent("movie_detail", parameters: [
            "movie_title": movie.title,
            "movie_released": movie.released,
            "movie_genre": movie.genre,
            "movie_actors": movie.actors,
            "movie_language": movie.language,
            "movie_country": movie.country,
            "movie_imdb_rating": movie.imdbRating,
            "movie_director": movie.director,
            "movie_image_url": movie.image,
            "movie_runtime": movie.runtime
            ])
    }
}
