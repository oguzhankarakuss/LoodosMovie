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
    func fetchMovies(completion: @escaping (Result<Search>) -> Void)
    func fetchMovieDetail(completion: @escaping (Result<Movie>) -> Void)
}

class MoviesService: MoviesServiceProtocol{
    
    public enum Error: Swift.Error {
        case serializationError(internal: Swift.Error)
        case networkError(internal: Swift.Error)
    }
    
    public init() { }
    
    func fetchMovies(completion: @escaping (Result<Search>) -> Void){
        let asd = Parameters.parameter
        let urlString = "https://www.omdbapi.com/?s=batman&apikey=a145db2f" //tt0103359
        AF.request(urlString).responseData { (response) in
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
    
    func fetchMovieDetail(completion: @escaping (Result<Movie>) -> Void) {
        let urlString = "https://www.omdbapi.com/?i=tt0103359&apikey=a145db2f" //tt0103359
        AF.request(urlString).responseData { (response) in
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
