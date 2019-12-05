//
//  CreateCardViewController.swift
//  aylto
//
//  Created by Lary Tertuliano on 27/11/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//

import UIKit

class EventName: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phraseTextField: UITextView!
    @IBOutlet weak var personsOnEventTextField: UITextField!
    @IBOutlet weak var personsConnectedTextField: UITextField!
    @IBOutlet weak var personsNotConnectedTextField: UITextField!
    @IBOutlet weak var albumCoverView: UIView!
    @IBOutlet weak var albumCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        albumCollectionView.delegate = self
        albumCollectionView.dataSource = self
        profilePicture.makeRounded()
        
        albumCollectionView.register(UINib(nibName: "CardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cardCollectionViewCell")
        
        // Do any additional setup after loading the view.
        // Teste  do gitkraken
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = albumCollectionView.dequeueReusableCell(withReuseIdentifier: "cardCollectionViewCell", for: indexPath) as! CardCollectionViewCell
        
        cell.testeVIew.image  =  UIImage(named: "teste")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: albumCollectionView.frame.width / 2 - 30, height: albumCollectionView.frame.height / 2 - 10)
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
