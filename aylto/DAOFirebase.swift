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
        
    static func save(collection: String, itemData: [String : Any]) {
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil
        
        
        ref = db.collection(collection).addDocument(data: itemData) { err in
            if let err = err {
                print("Error adding document: \(err.localizedDescription)")
            } else {
                print("Document added with ID \(ref!.documentID)")
            }
        }
    }
    
    static func remove(collection: String, id: String) {
        let db = Firestore.firestore()
        db.collection(collection).document(id).delete() { err in
            if let err = err {
                print("Error removing document: \(err.localizedDescription)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    
    static func load(collection: String, completion: @escaping () -> ()) {
        let db = Firestore.firestore()
        db.collection(collection).getDocuments() {(querySnapshot, err) in
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
    
    static func observeOsGays() {
        let db = Firestore.firestore()
        
        
//        db.collection("itens").addSnapshotListener { (QuerySnapshot, Error) in
//            self.load(collection: "itens") {
//                print("Finished loading")
//            }
//        }
        
    }
}




