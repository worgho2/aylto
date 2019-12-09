//
//  LoginScreenViewController.swift
//  aylto
//
//  Created by Andre Tosin on 09/12/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//

import UIKit
import AuthenticationServices

class LoginScreenViewController: UIViewController {

    @IBOutlet weak var buttonView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    func setupView() {
        let appleButton = ASAuthorizationAppleIDButton()
        appleButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(appleButton)
        NSLayoutConstraint.activate([
            appleButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
            appleButton.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            appleButton.widthAnchor.constraint(equalTo: buttonView.widthAnchor, multiplier: 0.9),
            appleButton.heightAnchor.constraint(equalTo: buttonView.heightAnchor, multiplier: 0.25)
        ])
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
