import Foundation
import UIKit

class Model {
    static let shared = Model()
    
    private init() { }
    
    var dataObservers: [ObserverDelegate] = []
    
    var interests:[Int] = []
    var onIntends: [Int] = []
   
    var usuario: Usuario! = Usuario(idDoUsuario: "", primeiroNome: "Lary", sobrenome: "Tertuliano", email: "", idDasFigurinhas: [], idDosAlbuns: [])
    var figurinhaAtual: Figurinha?
    var figurinhaSelecionadaIndex: Int! = 0
    
    var eventos: [Evento]! = [
        Evento(idDoEvento: "90321", idDosAlbuns: [], nomeDoEvento: "WWDC - 2019", dataDoEvento: "", fotoDeCapa: ""),
        Evento(idDoEvento: "10321", idDosAlbuns: [], nomeDoEvento: "CocoaPods", dataDoEvento: "", fotoDeCapa: ""),
        Evento(idDoEvento: "20321", idDosAlbuns: [], nomeDoEvento: "NS Brazil", dataDoEvento: "", fotoDeCapa: ""),
    ]
    var albums: [Album]! = []
    var figurinhas: [Figurinha] = [
        Figurinha(idDaFigurinha: 0, foto: UIImage(named: "yumi")!, fotoCongelada: UIImage(named: "yumi_gelo")!, nome: "Yumi", frase: "Ask me what o did last Summer", interests: [0,3,4], onIntends: [0, 3]),
        Figurinha(idDaFigurinha: 0, foto: UIImage(named: "andre")!, fotoCongelada: UIImage(named: "andre_gelo")!, nome: "Andre", frase: "Ask me Anything about cars", interests: [1], onIntends: [1, 3]),
        Figurinha(idDaFigurinha: 0, foto: UIImage(named: "otavio")!, fotoCongelada: UIImage(named: "otavio_gelo")!, nome: "Otavio", frase: "Ask me if your system can be hacked", interests: [4], onIntends: [1, 2, 4]),
        Figurinha(idDaFigurinha: 0, foto: UIImage(named: "taques")!, fotoCongelada: UIImage(named: "taques_gelo")!, nome: "Taques", frase: "Ask me anything about sourdough and kombucha", interests: [3], onIntends: [2, 3, 4])
    ]
    
}
