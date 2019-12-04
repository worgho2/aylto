//
//  Album.swift
//  aylto
//
//  Created by Andre Tosin on 28/11/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//
import FirebaseFirestore

class Album {
    internal init(idDoAlbum: Int, idDoDono: Int, idDoEvento: Int, idDasFigurinhas: [Int]) {
        self.idDoAlbum = idDoAlbum
        self.idDoDono = idDoDono
        self.idDoEvento = idDoEvento
        self.idDasFigurinhas = idDasFigurinhas
    }
    
    var idDoAlbum: Int
    var idDoDono: Int
    var idDoEvento: Int
    var idDasFigurinhas: [Int]
    
    func mapToDictionary() -> [String : Any] {
        var itemData: [String : Any] = [ : ]
        itemData["idDoAlbum"] = self.idDoAlbum
        itemData["idDoDono"] = self.idDoDono
        itemData["idDoEvento"] = self.idDoEvento
        itemData["idDasFigurinhas"] = self.idDasFigurinhas
        return itemData
    }
    
    static func mapToObject(dict: [String : Any], document: QueryDocumentSnapshot) -> Album {
        let idDoAlbum = dict["idDoAlbum"] as! Int
        let idDoDono = dict["idDoDono"] as! Int
        let idDoEvento = dict["idDoEvento"] as! Int
        let idDasFigurinhas = dict["idDasFigurinhas"] as! [Int]
    
        return Album(idDoAlbum: idDoAlbum, idDoDono: idDoDono, idDoEvento: idDoEvento, idDasFigurinhas: idDasFigurinhas)
    }
    
    
}
