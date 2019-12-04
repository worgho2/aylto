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
    @IBOutlet weak var insertEventCodeHereView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.

            for field in fields {
                field.keyboardType = .numberPad
                print(field.tag)
                field.roundCorners(radius: 4.0)
            }
            insertEventCodeHereView.roundCorners(radius: 40.0)
            fields.first?.layer.borderWidth = 1
            fields.first?.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            self.backgroundView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            self.backgroundView.alpha = 0
        }

        override func viewDidAppear(_ animated: Bool) {
//            fields.first?.becomeFirstResponder()
            
            UIView.animate(withDuration: 0.09) {
                self.backgroundView.alpha = 0.7
            }
            
        }
        
        @IBAction func textChanged(_ sender: UITextField) {
            let nextIndex = sender.tag + 1
            fields[nextIndex].becomeFirstResponder()
            fields[nextIndex].layer.borderWidth = 1
            fields[nextIndex].layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            fields[sender.tag].layer.borderWidth = 0
        }
        
        @IBAction func checkCode(_ sender: Any) {
            // Code
            checkLabel.isHidden = false
            view.endEditing(true)
            performSegue(withIdentifier: "home", sender: self)
        }
    
    }

