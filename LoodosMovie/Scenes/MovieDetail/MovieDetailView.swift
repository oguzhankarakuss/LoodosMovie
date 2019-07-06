//
//  MovieDetailView.swift
//  LoodosMovie
//
//  Created by Oğuzhan Karakuş on 6.07.2019.
//  Copyright © 2019 Oğuzhan Karakuş. All rights reserved.
//

import UIKit

final class MovieDetailView: UIView{
    
    @IBOutlet private weak var titleLbl: UILabel!
    @IBOutlet private weak var releasedLbl: UILabel!
    @IBOutlet private weak var genreLbl: UILabel!
    @IBOutlet private weak var actorsLbl: UILabel!
    @IBOutlet private weak var plotLbl: UILabel!
    @IBOutlet private weak var languageLbl: UILabel!
    @IBOutlet private weak var countryLbl: UILabel!
    @IBOutlet private weak var imdbRatingLbl: UILabel!
    @IBOutlet private weak var directorLbl: UILabel!
    @IBOutlet private weak var writerLbl: UILabel!
    @IBOutlet private weak var runtimeLbl: UILabel!
    @IBOutlet private weak var imageLbl: UILabel!
    
    func setLoading(_ isLoading: Bool){
        UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
    }
    
}

extension MovieDetailView: MovieDetailViewProtocol{
    func updateMovieDetail(_ movieDetail: MovieDetailPresentation) {
        titleLbl.text = movieDetail.title
        releasedLbl.text = movieDetail.released
    }
}
