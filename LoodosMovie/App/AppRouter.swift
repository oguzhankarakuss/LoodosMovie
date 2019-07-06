//
//  AppRouter.swift
//  LoodosMovie
//
//  Created by Oğuzhan Karakuş on 6.07.2019.
//  Copyright © 2019 Oğuzhan Karakuş. All rights reserved.
//

import UIKit

final class AppRouter{
    
    let window: UIWindow
    
    init(){
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start(){
        let viewController = MovieListBuilder.make()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
