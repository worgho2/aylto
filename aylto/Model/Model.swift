import Foundation
import UIKit

class Model {
    static let shared = Model()
    private init() {
           
    }
    
    var usuarios = [
        Usuario(idDoUsuario: "001818.d21931b6979443b787636b9192711adf.1836", primeiroNome: "André", sobrenome: "Tosin", email: "andre_tosin@icloud.com", idDasFigurinhas: [0, 1, 2], idDosAlbuns: [1, 2, 3, 4]),
        
    ]
    
    var albuns = [
        Album(idDoAlbum: 1, idDoDono: "001818.d21931b6979443b787636b9192711adf.1836", idDoEvento: 123456, idDasFigurinhas: [0, 1, 2]),
        Album(idDoAlbum: 2, idDoDono: "001818.d21931b6979443b787636b9192711adf.1836", idDoEvento: 111111, idDasFigurinhas: [0, 1, 2]),
        Album(idDoAlbum: 3, idDoDono: "001818.d21931b6979443b787636b9192711adf.1836", idDoEvento: 222222, idDasFigurinhas: [0, 1, 2])

    ]
    
    var figurinhas = [
        Figurinha(idDaFigurinha: 0, idDoDono: "001818.d21931b6979443b787636b9192711adf.1836", foto: "foto0.jpeg", nome: "Figurinha 0 Andre", frase: "Frase 0 Andre", interesse: "Interesse 0 andre", buscoNoEvento: "Busco 0 andre"),
        Figurinha(idDaFigurinha: 1, idDoDono: "001818.d21931b6979443b787636b9192711adf.1836", foto: "foto1.jpeg", nome: "Figurinha 1 Andre", frase: "Frase 1 Andre", interesse: "Interesse 1 andre", buscoNoEvento: "Busco 1 andre"),
        Figurinha(idDaFigurinha: 2, idDoDono: "001818.d21931b6979443b787636b9192711adf.1836", foto: "foto2.jpeg", nome: "Figurinha 2 Andre", frase: "Frase 2 Andre", interesse: "Interesse 2 andre", buscoNoEvento: "Busco 2 andre")
    ]
    
    var eventos = [
        Evento(idDoEvento: 123456, idDosAlbuns: [1], nomeDoEvento: "Evento 1", dataDoEvento: "20/12/12", fotoDeCapa: "Foto de capa evento 1"),
        Evento(idDoEvento: 111111, idDosAlbuns: [1], nomeDoEvento: "Evento 2", dataDoEvento: "20/12/12", fotoDeCapa: "Foto de capa evento 1"),
        Evento(idDoEvento: 222222, idDosAlbuns: [1], nomeDoEvento: "Evento 3", dataDoEvento: "20/12/12", fotoDeCapa: "Foto de capa evento 1")
    ]
    
    
    var usuarioAtual = Usuario(idDoUsuario: "", primeiroNome: "", sobrenome: "", email: "", idDasFigurinhas: [], idDosAlbuns: [])
    var meusAlbuns: [Album] = []
    var meusEventos: [Evento] = []
   
    
    
}
