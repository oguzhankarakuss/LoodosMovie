//
//  ViewController.swift
//  LoodosMovie
//
//  Created by Oğuzhan Karakuş on 4.07.2019.
//  Copyright © 2019 Oğuzhan Karakuş. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var service = MoviesService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.fetchMovies { (result) in
            print(result)
        }
    }


}

