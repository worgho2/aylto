//
//  Model.swift
//  aylto
//
//  Created by Andre Tosin on 26/11/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//

import Foundation
import UIKit

class Model {
    
    static let shared = Model()
    private init() {
        
    }
    
    var dataObservers = [ObserverDelegate]()
    
    var name = "abebad" {
        didSet {
            Model.shared.dataObservers.forEach( { $0.notify() } )
        }
    }
    
}
