import UIKit

class Album {
    var idDoAlbum: Int
    var idDoDono: String
    var idDoEvento: Int
    var idDasFigurinhas: [Int]
    
    init(idDoAlbum: Int, idDoDono: String, idDoEvento: Int, idDasFigurinhas: [Int]) {
           self.idDoAlbum = idDoAlbum
           self.idDoDono = idDoDono
           self.idDoEvento = idDoEvento
           self.idDasFigurinhas = idDasFigurinhas
    }
}
