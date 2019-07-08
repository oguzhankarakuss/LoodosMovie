//
//  CustomLabel.swift
//  LoodosMovie
//
//  Created by Oğuzhan Karakuş on 8.07.2019.
//  Copyright © 2019 Oğuzhan Karakuş. All rights reserved.
//

import UIKit

class CustomLabel : UILabel {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.textColor = UIColor(red: 77.0, green: 77.0, blue: 77.0, alpha: 1.0)
        self.font = UIFont(name: "HiraMaruProN-W4", size: 19)
    }
}
