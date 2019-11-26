//
//  ListaEventosViewController.swift
//  aylto
//
//  Created by Gabriel Taques on 22/11/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//

import UIKit

class ListaEventosViewController: UIViewController {

    @IBOutlet weak var labelTest: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTest.text = Model.shared.name
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func load(_ sender: Any) {
        DAOFirebase.load {
            print("Finished loading")
        }
    }
    
    @IBAction func update(_ sender: Any) {
        labelTest.text = Model.shared.name
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
