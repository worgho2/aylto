//
//  Usuario.swift
//  aylto
//
//  Created by Andre Tosin on 28/11/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//

import FirebaseFirestore

class Usuario {
    internal init(idDoUsuario: Int, idDasFigurinhas: [Int], idDosAlbuns: [Int], nome: String, email: String) {
        self.idDoUsuario = idDoUsuario
        self.idDasFigurinhas = idDasFigurinhas
        self.idDosAlbuns = idDosAlbuns
        
        self.nome = nome
        self.email = email
    }  
    
    
    
    
    var idDoUsuario: Int
    var idDasFigurinhas: [Int]
    var idDosAlbuns: [Int]
    
    var nome: String
    var email: String
    
    func mapToDictionary() -> [String : Any] {
        var itemData: [String : Any] = [ : ]
        itemData["idDoUsuario"] = self.idDoUsuario
        itemData["idDasFigurinhas"] = self.idDasFigurinhas
        itemData["idDosAlbuns"] = self.idDosAlbuns
        itemData["nome"] = self.nome 
        itemData["email"] = self.email
        return itemData
    }
    
    static func mapToObject(dict: [String : Any], document: QueryDocumentSnapshot) -> Usuario {
        let idDoUsuario = dict["idDoUsuario"] as! Int
        let idDasFigurinhas = dict["idDasFigurinhas"] as! [Int]
        let idDosAlbuns = dict["idDosAlbuns"] as! [Int]
        let nome = dict["nome"] as! String
        let email = dict["email"] as! String
        return Usuario(idDoUsuario: idDoUsuario, idDasFigurinhas: idDasFigurinhas, idDosAlbuns: idDosAlbuns, nome: nome, email: email)

    
    }
    
    
}
