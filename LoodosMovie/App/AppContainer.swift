//
//  AppContainer.swift
//  LoodosMovie
//
//  Created by Oğuzhan Karakuş on 6.07.2019.
//  Copyright © 2019 Oğuzhan Karakuş. All rights reserved.
//

import Foundation

let app = AppContainer()

final class AppContainer{
    
    let router = AppRouter()
    let service = MoviesService()
    
}
