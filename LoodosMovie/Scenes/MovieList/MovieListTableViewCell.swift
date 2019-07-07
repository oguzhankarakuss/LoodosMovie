//
//  MovieListTableViewCell.swift
//  LoodosMovie
//
//  Created by Oğuzhan Karakuş on 6.07.2019.
//  Copyright © 2019 Oğuzhan Karakuş. All rights reserved.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var cardView: UIView!
    let activityView = UIActivityIndicatorView(style: .gray)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        movieImageView.layer.cornerRadius = movieImageView.bounds.width / 2
        cardView.layer.cornerRadius = 4
        cardView.layer.shadowOpacity = 0.15
        cardView.layer.shadowOffset = .zero
        cardView.layer.shadowRadius = 3
        
        activityView.center = movieImageView.center
        movieImageView.addSubview(activityView)
        
    }
}
