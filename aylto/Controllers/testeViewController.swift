//
//  testeViewController.swift
//  aylto
//
//  Created by Lary Tertuliano on 29/11/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//

import UIKit

class TesteViewController: UIViewController {
    
    var qrView: QRCodeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let qrView = QRCodeView()
        
        qrView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(qrView)
        
        qrView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        qrView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        qrView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        qrView.heightAnchor.constraint(equalTo: qrView.widthAnchor).isActive = true
        
        self.qrView = qrView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        qrView.generateCode("www.facebook.com")
        
    }

}
