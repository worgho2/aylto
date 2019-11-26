//
//  DAOFirebase.swift
//  aylto
//
//  Created by Andre Tosin on 25/11/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//

import Firebase

class DAOFirebase {
    
    static func save(item: Item) {
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil
        
        let itemData: [String : Any] = item.mapToDictionary()
        
        ref = db.collection("itens").addDocument(data: itemData) { err in
            if let err = err {
                print("Error adding document: \(err.localizedDescription)")
            } else {
                print("Document added with ID \(ref!.documentID)")
            }
        }
    }
}



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
    
    func mapToObject(dict: [String : Any], document: QueryDocumentSnapshot) -> Item {
        let nome = dict["nome"] as! String
        let num = dict["num"] as! Int
        return Item(nome: nome, num: num)
    }
}
