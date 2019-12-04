//
//  UIView.swift
//  aylto
//
//  Created by Lary Tertuliano on 28/11/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func makeRounded() {
        self.layer.cornerRadius = self.frame.height / 2.0
        self.layer.masksToBounds = true
        self.layer.borderWidth = 5.0
    }
    
}

extension UIView {
    
    func roundCorners(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}

//extension UIViewController: UICollectionViewDataSource {
//
//     func numberOfSections(in collectionView: UICollectionView) -> Int {
//            return 1
//        }
//
//        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            return 10
//        }
//
//        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
//            cell.textLabel.text = String(indexPath.row + 1)
//            return cell
//        }
//    }
//
//    extension ViewController: UICollectionViewDelegate {
//
//        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            print(indexPath.item + 1)
//        }
//    }
