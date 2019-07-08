//
//  MovieListView.swift
//  LoodosMovie
//
//  Created by Oğuzhan Karakuş on 4.07.2019.
//  Copyright © 2019 Oğuzhan Karakuş. All rights reserved.
//

import UIKit
import Kingfisher
import NVActivityIndicatorView

final class MovieListView: UIView{
    
    weak var delegate: MovieListViewDelegate?
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var messageLbl: UILabel!
    @IBOutlet private weak var searchField: UITextField!{
        didSet{
            searchField.attributedPlaceholder = NSAttributedString(string: "Movie Name (Ex: Batman)",
                                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: 0xFFFFFF, a: 0.6)])
        }
    }
    @IBOutlet private weak var searchBtn: UIButton!
    private var movieList: [MoviePresentation] = []{
        didSet{
            if movieList.isEmpty{
                messageLbl.isHidden = false
            } else{
                messageLbl.isHidden = true
            }
        }
    }
    private var totalResults: Int!
    private var page = 1
    
    @IBAction private func searchButtonTapped(_ sender: UIButton){
        page = 1
        movieList = []
        totalResults = 0
        loadTable()
    }
    
}

extension MovieListView: MovieListViewProtocol{
    
    func updateMovieList(_ movieList: [MoviePresentation], totalResults: String, page: Int) {
        self.movieList.append(contentsOf: movieList)
        self.totalResults = Int(totalResults)
        self.page = page
        tableView.reloadData()
    }
    
    func setLoading(_ isLoading: Bool){
        UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
    }
    
    @objc func loadTable(){
        guard let text = searchField.text, text.count > 2 else { return }
        delegate?.sendRequest(at: text, page: page)
        print("giriyo page: \(page)")
    }
}

extension MovieListView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath) as! MovieListTableViewCell
        let movie = movieList[indexPath.row]
        cell.activityView.startAnimating()
        cell.titleLbl?.text = movie.title
        cell.subtitleLbl?.text = movie.detail
        cell.movieImageView.kf.setImage(with: URL(string: movie.image)){ result in
            switch result{
            case .success( _):
                cell.activityView.stopAnimating()
            case .failure(let error):
                print("KF: \(error)")
                cell.activityView.stopAnimating()
                cell.movieImageView.image = UIImage(named: "no_img")
            }}
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row > movieList.count - 2 {
            if movieList.count < totalResults{
                self.perform(#selector(loadTable), with: nil, afterDelay: 1.0)
            }
        }
    }
    
}

extension MovieListView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectMovie(at: movieList[indexPath.row].title)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if !tableView.isDecelerating {
            delegate?.didScroll(at: true)
        }
    }
}
