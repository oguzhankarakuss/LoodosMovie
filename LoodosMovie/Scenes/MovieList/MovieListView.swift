//
//  MovieListView.swift
//  LoodosMovie
//
//  Created by Oğuzhan Karakuş on 4.07.2019.
//  Copyright © 2019 Oğuzhan Karakuş. All rights reserved.
//

import UIKit

final class MovieListView: UIView{
    
    weak var delegate: MovieListViewDelegate?
    @IBOutlet private weak var tableView: UITableView!
    private var movieList: [MoviePresentation] = []
    
}

extension MovieListView: MovieListViewProtocol{
    func updateMovieList(_ movieList: [MoviePresentation]) {
        self.movieList = movieList
        tableView.reloadData()
    }
    
    func setLoading(_ isLoading: Bool){
        UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
    }
}

extension MovieListView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath)
        let movie = movieList[indexPath.row]
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = movie.detail
        return cell
    }
    
    
}

extension MovieListView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectMovie(at: indexPath.row)
    }
}
