//
//  FigurinhasViewController.swift
//  aylto
//
//  Created by Lary Tertuliano on 04/12/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//

import UIKit

class FigurinhasViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = figurinhasCollectionCiew.dequeueReusableCell(withReuseIdentifier: "eventAlbumCell", for: indexPath) as! EventAlbumCollectionViewCell
        
        if indexPath.item == 0 {
            cell.img.image = UIImage(named: "carteira-de-trabalho-add")
        } else {
            cell.img.image = UIImage(named: "albumEvent")

        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         if indexPath.item == 0 {
                   print(1)
                performSegue(withIdentifier: "addNumber", sender: nil)
               } else {
                   print(2)

               }
    }
    

    @IBOutlet weak var figurinhasCollectionCiew: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.figurinhasCollectionCiew.delegate = self
        self.figurinhasCollectionCiew.dataSource = self
        self.figurinhasCollectionCiew.register(UINib(nibName: "EventAlbumCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "eventAlbumCell")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addClick))
        // Do any additional setup after loading the view.
    }
    
    @objc
    func addClick() {
        performSegue(withIdentifier: "addNumber", sender: nil)
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
