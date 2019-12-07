import UIKit

class Usuario {
    var idDoUsuario: Int
    var idDasFigurinhas: [Int]
    var idDosAlbuns: [Int]
    
    var nome: String
    var email: String
    
    init(idDoUsuario: Int, idDasFigurinhas: [Int], idDosAlbuns: [Int], nome: String, email: String) {
        self.idDoUsuario = idDoUsuario
        self.idDasFigurinhas = idDasFigurinhas
        self.idDosAlbuns = idDosAlbuns
        
        self.nome = nome
        self.email = email
    }
        
}
