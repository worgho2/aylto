//
//  Item.swift
//  aylto
//
//  Created by Andre Tosin on 26/11/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class Item {
    internal init(nome: String, num: Int) {
        self.nome = nome
        self.num = num
    }
    var nome: String
    var num: Int
    
    func mapToDictionary() -> [String : Any] {
        var itemData: [String: Any] = [ : ]
        itemData["nome"] = self.nome
        itemData["num"] = self.num
        return itemData
    }
    
    static func mapToObject(dict: [String : Any], document: QueryDocumentSnapshot) -> Item {
        let nome = dict["nome"] as! String
        let num = dict["num"] as! Int
        return Item(nome: nome, num: num)
    }
}
