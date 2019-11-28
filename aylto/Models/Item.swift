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
    internal init(nome: String) {
        self.nome = nome
    }
    var nome: String
    
    func mapToDictionary() -> [String : Any] {
        var itemData: [String: Any] = [ : ]
        itemData["nome"] = self.nome
        return itemData
    }
    
    static func mapToObject(dict: [String : Any], document: QueryDocumentSnapshot) -> Item {
        let nome = dict["nome"] as! String
        return Item(nome: nome)
    }
}
