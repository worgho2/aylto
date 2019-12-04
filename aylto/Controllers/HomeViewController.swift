//
//  HomeViewController.swift
//  aylto
//
//  Created by Lary Tertuliano on 03/12/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, Datasource, Delegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.dataSource = self
        self.collectionView.delegate = self

        self.collectionView.register(MyCell.self, forCellWithReuseIdentifier: "addEventAlbumCell")
        // Do any additional setup after loading the view.
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
