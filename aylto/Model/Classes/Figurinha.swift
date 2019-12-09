import UIKit

class Figurinha {
    var idDaFigurinha: Int
    var idDoDono: String
    var foto: String
    var nome: String
    var frase: String
    //code, design, etc
    var interesse: String
    //trabalho, recrutar alguém, happy hour, etc
    var buscoNoEvento: String
    
    init(idDaFigurinha: Int, idDoDono: String, foto: String, nome: String, frase: String, interesse: String, buscoNoEvento: String) {
        self.idDaFigurinha = idDaFigurinha
        self.idDoDono = idDoDono
        self.foto = foto
        self.nome = nome
        self.frase = frase
        self.interesse = interesse
        self.buscoNoEvento = buscoNoEvento
    }
}

//func unique(array: [Figurinha]) -> [Figurinha] {
//    var returnArray: [Figurinha] = []
//    var indexArray: [Int] = []
//    var ctrl: Bool = true
//    
//    for item in array {
//        indexArray.append(item.idDaFigurinha)
//    }
//    indexArray.removeDuplicates()
//    
//    for index in indexArray {
//        ctrl = true
//        for item in array {
//            if item.idDaFigurinha == index && ctrl {
//                returnArray.append(item)
//                ctrl = false
//            }
//        }
//    }
//    return returnArray
//}
