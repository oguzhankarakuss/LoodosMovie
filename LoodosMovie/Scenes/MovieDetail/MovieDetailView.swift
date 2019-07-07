//
//  MovieDetailView.swift
//  LoodosMovie
//
//  Created by Oğuzhan Karakuş on 6.07.2019.
//  Copyright © 2019 Oğuzhan Karakuş. All rights reserved.
//

import UIKit
import Kingfisher

final class MovieDetailView: UIView{
    
    @IBOutlet private weak var titleLbl: UILabel!
    @IBOutlet private weak var releasedLbl: UILabel!
    @IBOutlet private weak var genreLbl: UILabel!
    @IBOutlet private weak var actorsLbl: UILabel!
    @IBOutlet private weak var languageLbl: UILabel!
    @IBOutlet private weak var countryLbl: UILabel!
    @IBOutlet private weak var imdbRatingLbl: UILabel!
    @IBOutlet private weak var directorLbl: UILabel!
    @IBOutlet private weak var runtimeLbl: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var smallImageView: UIImageView!
    
    
    func setLoading(_ isLoading: Bool){
        UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
    }
    
    func setActivityIndicator() -> UIActivityIndicatorView{
        let ac = UIActivityIndicatorView(style: .whiteLarge)
        ac.color = .gray
        return ac
    }
    
}

extension MovieDetailView: MovieDetailViewProtocol{
    func updateMovieDetail(_ movieDetail: MovieDetailPresentation) {
        
        let activityView = setActivityIndicator()
        
        titleLbl.text = movieDetail.title
        releasedLbl.text = movieDetail.released
        genreLbl.text = movieDetail.genre
        actorsLbl.text = movieDetail.actors
        languageLbl.text = movieDetail.language
        countryLbl.text = movieDetail.country
        imdbRatingLbl.text = movieDetail.imdbRating
        directorLbl.text = movieDetail.director
        runtimeLbl.text = movieDetail.runtime
        
        posterImageView.kf.setImage(with: movieDetail.image){ result in
            switch result{
            case .success( _):
                activityView.stopAnimating()
            case .failure(let error):
                print("KF: \(error)")
                activityView.stopAnimating()
                self.posterImageView.image = UIImage(named: "no_img")
            }}
        smallImageView.kf.setImage(with: movieDetail.image){ result in
            switch result{
            case .success( _):
                activityView.stopAnimating()
            case .failure(let error):
                print("KF: \(error)")
                activityView.stopAnimating()
                self.posterImageView.image = UIImage(named: "no_img")
            }}
    }
}
