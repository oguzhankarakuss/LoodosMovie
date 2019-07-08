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
    let activityView = UIActivityIndicatorView(style: .gray)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //movieImageView.layer.cornerRadius = movieImageView.bounds.width / 2
        
        
        activityView.center = movieImageView.center
        movieImageView.addSubview(activityView)
        
    }
}
