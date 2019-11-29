//
//  testeViewController.swift
//  aylto
//
//  Created by Lary Tertuliano on 29/11/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//

import UIKit

class TesteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (Timer) in
            self.performSegue(withIdentifier: "teste", sender: nil)
            
        }
    }

}
