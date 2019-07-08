//
//  SplashView.swift
//  LoodosMovie
//
//  Created by Oğuzhan Karakuş on 7.07.2019.
//  Copyright © 2019 Oğuzhan Karakuş. All rights reserved.
//

import UIKit
import RevealingSplashView

final class SplashView: UIView{
    
    @IBOutlet private weak var splashText: UILabel!
    @IBOutlet private weak var imageView: UIImageView!{
        didSet{
            let icon = UIImage(named: "splash")?.withRenderingMode(.alwaysTemplate)
            imageView.image = icon
            imageView.tintColor = UIColor(hex: 0xFFFFFF, a: 0.8)
        }
    }
    
}

extension SplashView: SplashViewProtocol{
    func updateText(_ text: String) {
        splashText.text = text
    }
    
    func updateColor(_ color: String) {
        
    }
    
    
}
