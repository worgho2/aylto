//
//  Figurinha.swift
//  aylto
//
//  Created by Lary Tertuliano on 25/11/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//

import FirebaseFirestore


class Figurinha {
    
    internal init(idDaFigurinha: Int, idDoDono: Int, foto: String, nome: String, frase: String, interesse: String, buscoNoEvento: String) {
        self.idDaFigurinha = idDaFigurinha
        self.idDoDono = idDoDono
        self.foto = foto
        self.nome = nome
        self.frase = frase
        self.interesse = interesse
        self.buscoNoEvento = buscoNoEvento
    }
    var idDaFigurinha: Int
    var idDoDono: Int
    var foto: String
    var nome: String
    var frase: String
    //code, design, etc
    var interesse: String
    //trabalho, recrutar alguém, happy hour, etc
    var buscoNoEvento: String
    
    
    func mapToDictionary() -> [String : Any] {
        var itemData: [String : Any] = [ : ]
        itemData["idDaFigurinha"] = self.idDaFigurinha
        itemData["idDoDono"] = self.idDoDono
        itemData["nome"] = self.nome
        itemData["foto"] = self.foto
        itemData["frase"] = self.frase
        itemData["interesse"] = self.interesse
        itemData["buscoNoEvento"] = self.buscoNoEvento
        return itemData
    }
    
    static func mapToObject(dict: [String : Any], document: QueryDocumentSnapshot) -> Figurinha {
        let idDaFigurinha = dict["idDaFigurinha"] as! Int
        let idDoDono = dict["idDoDono"] as! Int
        let nome = dict["nome"] as! String
        let foto = dict["foto"] as! String
        let frase = dict["frase"] as! String
        let interesse = dict["interesse"] as! String
        let buscoNoEvento = dict["buscoNoEvento"] as! String
        return Figurinha(idDaFigurinha: idDaFigurinha, idDoDono: idDoDono, foto: foto, nome: nome, frase: frase, interesse: interesse, buscoNoEvento: buscoNoEvento)
        
    }
    
}

func unique(array: [Figurinha]) -> [Figurinha] {
    var returnArray: [Figurinha] = []
    var indexArray: [Int] = []
    var ctrl: Bool = true
    
    for item in array {
        indexArray.append(item.idDaFigurinha)
    }
    indexArray.removeDuplicates()
    
    for index in indexArray {
        ctrl = true
        for item in array {
            if item.idDaFigurinha == index && ctrl {
                returnArray.append(item)
                ctrl = false
            }
        }
    }
    return returnArray
}
