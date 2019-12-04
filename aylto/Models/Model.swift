//
//  Model.swift
//  aylto
//
//  Created by Andre Tosin on 26/11/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//

import Foundation
import UIKit

class Model {
    
    static let shared = Model()
    private init() {
        
    }
    
    var dataObservers = [ObserverDelegate]()
    
    var name = "abebad" {
        didSet {
            Model.shared.dataObservers.forEach( { $0.notify() } )
        }
    }
    
    var eventos: [Evento] = []
    var albuns: [Album] = []
    var outrasFigurinhas: [Figurinha] = []
    var minhasFigurinhas: [Figurinha] = []
    var figurinhas: [Figurinha] = []
    var usuario: Usuario = Usuario(idDoUsuario: 9999, idDasFigurinhas: [999,999,999], idDosAlbuns: [999,999,999], nome: "err", email: "err")
    
    
}
