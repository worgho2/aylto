import UIKit

class Usuario {
    
    internal init(idDoUsuario: String, primeiroNome: String, sobrenome: String, email: String, idDasFigurinhas: [Int], idDosAlbuns: [Int]) {
        self.idDoUsuario = idDoUsuario
        self.primeiroNome = primeiroNome
        self.sobrenome = sobrenome
        self.email = email
        self.idDasFigurinhas = idDasFigurinhas
        self.idDosAlbuns = idDosAlbuns
    }
    
    var idDoUsuario: String
    var primeiroNome: String
    var sobrenome: String
    var email: String
    var idDasFigurinhas: [Int]
    var idDosAlbuns: [Int]
        
}

extension Usuario: CustomDebugStringConvertible {
    var debugDescription: String {
        return """
        ID: \(idDoUsuario)
        First name: \(primeiroNome)
        Last name: \(sobrenome)
        Email: \(email)
        """
    }
}
