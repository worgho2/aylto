import UIKit

class Figurinha {
    var idDaFigurinha: Int
    var foto: UIImage
    var fotoCongelada: UIImage
    var nome: String
    var frase: String
    //code, design, etc
    var interests: [Int]
    //trabalho, recrutar alguém, happy hour, etc
    var onIntends: [Int]
    var isCongelado: Bool
    
    init(idDaFigurinha: Int, foto: UIImage, fotoCongelada: UIImage, nome: String, frase: String, interests: [Int], onIntends: [Int], isCongelado: Bool = true) {
        self.idDaFigurinha = idDaFigurinha
        self.foto = foto
        self.fotoCongelada = fotoCongelada
        self.nome = nome
        self.frase = frase
        self.interests = interests
        self.onIntends = onIntends
        self.isCongelado = isCongelado
    }
}
