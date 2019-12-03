//
//  CreateCardViewController.swift
//  aylto
//
//  Created by Lary Tertuliano on 27/11/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//

import UIKit

class EventName: UIViewController {
    
    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phraseTextField: UITextView!
    @IBOutlet weak var personsOnEventTextField: UITextField!
    @IBOutlet weak var personsConnectedTextField: UITextField!
    @IBOutlet weak var personsNotConnectedTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePicture.makeRounded()

        // Do any additional setup after loading the view.
        // Teste  do gitkraken
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
