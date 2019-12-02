//
//  UIView.swift
//  aylto
//
//  Created by Lary Tertuliano on 28/11/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func makeRounded() {
        self.layer.cornerRadius = self.frame.height / 2.0
        self.layer.masksToBounds = true
        self.layer.borderWidth = 5.0
    }
    
}

extension UIView {
    
    func roundCorners(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
