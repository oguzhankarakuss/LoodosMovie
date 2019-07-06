//
//  SplashViewController.swift
//  LoodosMovie
//
//  Created by Oğuzhan Karakuş on 7.07.2019.
//  Copyright © 2019 Oğuzhan Karakuş. All rights reserved.
//

import UIKit
import Reachability

class SplashViewController: UIViewController {
    
    let reachability = Reachability()!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        DispatchQueue.main.asyncAfter(deadline:.now() + 3.0){
            if self.reachability.connection != .none {
                //TODO: open
                let movieListViewController = MovieListBuilder.make()
                self.show(movieListViewController, sender: nil)
            } else {
                self.showNetworkError()
            }
        }
        
    }
    
    func showNetworkError(){
        let networkAlert = UIAlertController(title: "Please check your network connection!", message: nil, preferredStyle: .alert)
        networkAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(networkAlert, animated: true, completion: nil)
    }
}
