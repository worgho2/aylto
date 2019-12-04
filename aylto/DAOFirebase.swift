//
//  DAOFirebase.swift
//  aylto
//
//  Created by Andre Tosin on 25/11/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//

import Firebase
import FirebaseFirestore

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}




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
                    let item = Evento.mapToObject(dict: document.data(), document: document)
                    Model.shared.eventos.append(item)
                    
                    
                }
            }
            completion()
        }
    }
    
    static func loadUser(uid: Int, completion: @escaping () -> ()) {
        let db = Firestore.firestore()
        db.collection("usuarios").getDocuments() {(querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let user = Usuario.mapToObject(dict: document.data(), document: document)
                    if user.idDoUsuario == uid {
                        Model.shared.usuario = user
                    }
                }
            }
            completion()
        }
    }
    
    static func loadFigurinha(uid: Int, completion: @escaping () -> ()) {
        let db = Firestore.firestore()
        db.collection("figurinhas").getDocuments() {(querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let figurinha = Figurinha.mapToObject(dict: document.data(), document: document)
                    Model.shared.outrasFigurinhas.removeAll()
                    Model.shared.minhasFigurinhas.removeAll()
                    
                    
                    
                    if figurinha.idDoDono == uid {
                        Model.shared.figurinhas.append(figurinha)
                    }
                    
                    for album in Model.shared.albuns {
                        for stickerId in album.idDasFigurinhas {
                            if figurinha.idDaFigurinha == stickerId {
                                Model.shared.figurinhas.append(figurinha)
                            }
                        }
                    }
                    
                }
            }
            Model.shared.figurinhas = unique(array: Model.shared.figurinhas)
            Model.shared.figurinhas = Model.shared.figurinhas.sorted { (fig1, fig2) -> Bool in
                return fig1.idDaFigurinha < fig2.idDaFigurinha
            }
            completion()
        }
    }
    
    static func loadEventos(completion: @escaping () -> ()) {
        let db = Firestore.firestore()
        db.collection("eventos").getDocuments() {(querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                Model.shared.eventos.removeAll()
                for document in querySnapshot!.documents {
                    let item = Evento.mapToObject(dict: document.data(), document: document)
                    Model.shared.eventos.append(item)
                }
            }
            completion()
        }
    }
    
    static func loadAlbuns(uid: Int, completion: @escaping () -> ()) {
        let db = Firestore.firestore()
        db.collection("albuns").getDocuments() {(querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                Model.shared.albuns.removeAll()
                for document in querySnapshot!.documents {
                    let album = Album.mapToObject(dict: document.data(), document: document)
                    
                    if album.idDoDono == uid {
                        Model.shared.albuns.append(album)
                    }
                    
                    
                }
            }
            
            completion()
        }
    }
    
    
    
    static func loadData(uid: Int, completion: @escaping () -> ()) {
        self.loadAlbuns(uid: uid) {
            self.loadFigurinha(uid: uid) {
                print("Finished loading!")
                completion()
            }
        }
    }

    
    
    
    
    static func observeOsGays() {
        let _ = Firestore.firestore()
        
        
//        db.collection("itens").addSnapshotListener { (QuerySnapshot, Error) in
//            self.load(collection: "itens") {
//                print("Finished loading")
//            }
//        }
        
    }
}


// UPDATE FIRESTORE
//self.DBRef.collection("users").whereField("name", isEqualTo: "kavin").getDocuments() { (querySnapshot, err) in
//    if let err = err {
//        // Some error occured
//    } else if querySnapshot!.documents.count != 1 {
//        // Perhaps this is an error for you?
//    } else {
//        let document = querySnapshot!.documents.first
//        document.reference.updateData([
//            "age": 99
//        ])
//    }
//}
