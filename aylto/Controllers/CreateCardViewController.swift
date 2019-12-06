//
//  CreateCardViewController.swift
//  aylto
//
//  Created by Lary Tertuliano on 29/11/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//

import UIKit

class CardViewController: UIViewController,  UICollectionViewDelegate, UICollectionViewDataSource {
  
    

    @IBOutlet var disciplinesCollection: UICollectionView!
    
    
    @IBOutlet weak var interestsCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        disciplinesCollection.delegate = self
        disciplinesCollection.dataSource =  self
        
        interestsCollection.delegate = self
        interestsCollection.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == disciplinesCollection {
            return 10
        } else {
            return 5
        }
      }
      
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == disciplinesCollection {
            return setDisciplineCell(collectionView, indexPath)
        } else {
//            fatalError("Método não implementado")
            return setInterestCell(collectionView, indexPath)
        }
      }
    
    private func setDisciplineCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "disciplinesCell", for: indexPath) as! DisciplinesCollectionViewCell
        
        return cell
    }
    
    private func setInterestCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell {
          let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "interestsCell", for: indexPath) as! InterestsCollectionViewCell
          
          return cell
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
