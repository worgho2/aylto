//
//  DAOFirebase.swift
//  aylto
//
//  Created by Andre Tosin on 25/11/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//

import Firebase
import FirebaseFirestore

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
    
    static func remove(id: String) {
        let db = Firestore.firestore()
        db.collection("itens").document(id).delete() { err in
            if let err = err {
                print("Error removing document: \(err.localizedDescription)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    
    static func load(completion: @escaping () -> ()) {
        let db = Firestore.firestore()
        db.collection("itens").getDocuments() {(querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let item = Item.mapToObject(dict: document.data(), document: document)
                    Model.shared.name = item.nome
                    completion()
                }
            }
        }
    }
}




