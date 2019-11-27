//
//  EventNumberViewController.swift
//  aylto
//
//  Created by Lary Tertuliano on 25/11/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//

import UIKit

class EventNumberViewController: UIViewController {
        
        @IBOutlet var fields: Array<UITextField>!
        @IBOutlet weak var checkLabel: UILabel!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
            for field in fields {
                field.keyboardType = .numberPad
            }
        }

        override func viewDidAppear(_ animated: Bool) {
            fields.first?.becomeFirstResponder()
            
        }
        
        @IBAction func textChanged(_ sender: UITextField) {
            let nextIndex = sender.tag + 1
            fields[nextIndex].becomeFirstResponder()
        }
        
        @IBAction func checkCode(_ sender: Any) {
            // Code
            checkLabel.isHidden = false
            view.endEditing(true)
            performSegue(withIdentifier: "home", sender: self)
        }
    }

