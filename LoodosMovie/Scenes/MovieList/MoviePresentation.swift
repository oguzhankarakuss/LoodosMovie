//
//  MoviePresentation.swift
//  LoodosMovie
//
//  Created by Oğuzhan Karakuş on 6.07.2019.
//  Copyright © 2019 Oğuzhan Karakuş. All rights reserved.
//

import Foundation

struct MoviePresentation {
    let title: String
    let detail: String
}

extension MoviePresentation{
    init(search: SearchElement) {
        self.init(title: search.title, detail: search.year)
    }
}
