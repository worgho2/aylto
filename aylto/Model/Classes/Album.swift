import UIKit

class Album {
    var idDoAlbum: Int
    var idDoDono: Int
    var idDoEvento: Int
    var idDasFigurinhas: [Int]
    
    init(idDoAlbum: Int, idDoDono: Int, idDoEvento: Int, idDasFigurinhas: [Int]) {
           self.idDoAlbum = idDoAlbum
           self.idDoDono = idDoDono
           self.idDoEvento = idDoEvento
           self.idDasFigurinhas = idDasFigurinhas
    }
}
