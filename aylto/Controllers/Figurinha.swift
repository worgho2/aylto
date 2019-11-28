//
//  Figurinha.swift
//  aylto
//
//  Created by Lary Tertuliano on 25/11/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//

import FirebaseFirestore

class Figurinha {
    
    internal init(id: Int, foto: String, nome: String, frase: String, interesse: String, buscoNoEvento: String) {
        self.id = id
        self.foto = foto
        self.nome = nome
        self.frase = frase
        self.interesse = interesse
        self.buscoNoEvento = buscoNoEvento
    }
    var id: Int
    var foto: String
    var nome: String
    var frase: String
    //code, design, etc
    var interesse: String
    //trabalho, recrutar alguém, happy hour, etc
    var buscoNoEvento: String
    
    
    func mapToDictionary() -> [String : Any] {
        var itemData: [String : Any] = [ : ]
        itemData["id"] = self.id
        itemData["nome"] = self.nome
        itemData["foto"] = self.foto
        itemData["frase"] = self.frase
        itemData["interesse"] = self.interesse
        itemData["buscoNoEvento"] = self.buscoNoEvento
        return itemData
    }
    
    func mapToObject(dict: [String : Any], document: QueryDocumentSnapshot) -> Figurinha {
        let id = dict["id"] as! Int
        let nome = dict["nome"] as! String
        let foto = dict["foto"] as! String
        let frase = dict["frase"] as! String
        let interesse = dict["interesse"] as! String
        let buscoNoEvento = dict["buscoNoEvento"] as! String
        return Figurinha(id: id, foto: foto, nome: nome, frase: frase, interesse: interesse, buscoNoEvento: buscoNoEvento)
        
    }
}
