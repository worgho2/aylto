import UIKit

class Evento {
    var idDoEvento: Int
    var idDosAlbuns: [Int]
    var nomeDoEvento: String
    var dataDoEvento: String
    var fotoDeCapa: String
    
    init(idDoEvento: Int, idDosAlbuns: [Int], nomeDoEvento: String, dataDoEvento: String, fotoDeCapa: String) {
        self.idDoEvento = idDoEvento
        self.idDosAlbuns = idDosAlbuns
        self.nomeDoEvento = nomeDoEvento
        self.dataDoEvento = dataDoEvento
        self.fotoDeCapa = fotoDeCapa
    }
}
