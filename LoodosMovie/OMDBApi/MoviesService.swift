//
//  MovieService.swift
//  LoodosMovie
//
//  Created by Oğuzhan Karakuş on 4.07.2019.
//  Copyright © 2019 Oğuzhan Karakuş. All rights reserved.
//

import Foundation
import Alamofire

protocol MoviesServiceProtocol {
    func fetchMovies(searchName: String, page: Int, completion: @escaping (Result<Search>) -> Void)
    func fetchMovieDetail(movieTitle: String, completion: @escaping (Result<Movie>) -> Void)
}

class MoviesService: MoviesServiceProtocol{
    
    public enum Error: Swift.Error {
        case serializationError(internal: Swift.Error)
        case networkError(internal: Swift.Error)
    }
    
    public init() { }
    
    func fetchMovies(searchName: String, page: Int, completion: @escaping (Result<Search>) -> Void){
        let queryParams: [String: String] = [
            "s": searchName,
            "type": "movie",
            "page": "\(page)",
            "apikey": Constants.API_KEY
        ]
        let url = Helper.makeUrl(path: "/", queryItems: queryParams)
        
        AF.request(url).responseData { (response) in
            switch response.result{
            case .success(let data):
                do{
                    let response = try JSONDecoder().decode(Search.self, from: data)
                    completion(.success(response))
                } catch{
                    completion(.failure(Error.serializationError(internal: error)))
                }
            case .failure(let error):
                completion(.failure(Error.networkError(internal: error)))
            }
        }
        
    }
    
    func fetchMovieDetail(movieTitle: String, completion: @escaping (Result<Movie>) -> Void) {
        let queryParams: [String: String] = [
            "t": movieTitle,
            "apikey": Constants.API_KEY
        ]
        let url = Helper.makeUrl(path: "/", queryItems: queryParams)
        
        AF.request(url).responseData { (response) in
            switch response.result{
            case .success(let data):
                do{
                    let response = try JSONDecoder().decode(Movie.self, from: data)
                    completion(.success(response))
                } catch{
                    completion(.failure(Error.serializationError(internal: error)))
                }
            case .failure(let error):
                completion(.failure(Error.networkError(internal: error)))
            }
        }
    }
    
}
