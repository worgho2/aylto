//
//  Data.swift
//  aylto
//
//  Created by Andre Tosin on 09/12/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//

import Foundation

class Data {
    internal init(usuario: Usuario, albuns: [Album], figurinhas: [Figurinha]) {
        self.usuario = usuario
        self.albuns = albuns
        self.figurinhas = figurinhas
    }
    
    
    static let shared = Data()
    
    var usuario: Usuario
    var albuns: [Album]
    var figurinhas: [Figurinha]
    
    
}
