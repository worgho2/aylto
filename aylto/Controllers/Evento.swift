//
//  Evento.swift
//  aylto
//
//  Created by Lary Tertuliano on 25/11/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//
import FirebaseFirestore


class Evento {
    
    internal init(idDoEvento: Int, nomeDoEvento: String, dataDoEvento: String, fotoDeCapa: String) {
        self.idDoEvento = idDoEvento
        self.nomeDoEvento = nomeDoEvento
        self.dataDoEvento = dataDoEvento
        self.fotoDeCapa = fotoDeCapa
    }
    var idDoEvento: Int
    var nomeDoEvento: String
    var dataDoEvento: String
    var fotoDeCapa: String
    
    func mapToDictionary() -> [String : Any] {
        var itemData: [String: Any] = [ : ]
        itemData["idDoEvento"] = self.idDoEvento
        itemData["nomeDoEvento"] = self.nomeDoEvento
        itemData["dataDoEvento"] = self.dataDoEvento
        itemData["fotoDeCapa"] = self.fotoDeCapa
        return itemData
    }
    
    static func mapToObject(dict: [String : Any], document: QueryDocumentSnapshot) -> Evento {
        let idDoEvento = dict["idDoEvento"] as! Int
        let nomeDoEvento = dict["nomeDoEvento"] as! String
        let dataDoEvento = dict["dataDoEvento"] as! String
        let fotoDeCapa = dict["fotoDeCapa"] as! String
        return Evento(idDoEvento: idDoEvento, nomeDoEvento: nomeDoEvento, dataDoEvento: dataDoEvento, fotoDeCapa: fotoDeCapa)
    }
}
