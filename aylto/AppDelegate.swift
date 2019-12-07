import UIKit
//import Firebase
//import FirebaseFirestore
//AS PASTAS DO FIREBASE ESTÃO NO PROJETO, MAS NÃO ESTÃO REFERENCIADAS


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //FirebaseApp.configure()
        
        
//                // SETS BANCO DE DADOS ************** TESTE **************
//
//                    // FIGURINHAS
//
//                DAOFirebase.save(collection: "figurinhas", itemData: Figurinha(idDaFigurinha: 1, idDoDono: 4, foto: "fotoYumi1.jpeg", nome: "Yumi1", frase: "fraseYumi1", interesse: "interesseYumi1", buscoNoEvento: "oQueYumi1Busca").mapToDictionary())
//                DAOFirebase.save(collection: "figurinhas", itemData: Figurinha(idDaFigurinha: 2, idDoDono: 4, foto: "fotoYumi2.jpeg", nome: "Yumi2", frase: "fraseYumi2", interesse: "interesseYumi2", buscoNoEvento: "oQueYumi2Busca").mapToDictionary())
//
//                DAOFirebase.save(collection: "figurinhas", itemData: Figurinha(idDaFigurinha: 3, idDoDono: 3, foto: "fotoLary1.jpeg", nome: "Lary1", frase: "fraseLary1", interesse: "interesseLary1", buscoNoEvento: "oQueLary1Busca").mapToDictionary())
//                DAOFirebase.save(collection: "figurinhas", itemData: Figurinha(idDaFigurinha: 4, idDoDono: 3, foto: "fotoLary2.jpeg", nome: "Lary2", frase: "fraseLary2", interesse: "interesseLary2", buscoNoEvento: "oQueLary2Busca").mapToDictionary())
//                DAOFirebase.save(collection: "figurinhas", itemData: Figurinha(idDaFigurinha: 5, idDoDono: 3, foto: "fotoLary3.jpeg", nome: "Lary3", frase: "fraseLary3", interesse: "interesseLary3", buscoNoEvento: "oQueLary3Busca").mapToDictionary())
//
//                DAOFirebase.save(collection: "figurinhas", itemData: Figurinha(idDaFigurinha: 6, idDoDono: 2, foto: "fotoTaques1.jpeg", nome: "Taques1", frase: "fraseTaques1", interesse: "interesseTaques1", buscoNoEvento: "oQueTaques1Busca").mapToDictionary())
//                DAOFirebase.save(collection: "figurinhas", itemData: Figurinha(idDaFigurinha: 7, idDoDono: 2, foto: "fotoTaques2.jpeg", nome: "Taques2", frase: "fraseTaques2", interesse: "interesseTaques2", buscoNoEvento: "oQueTaques2Busca").mapToDictionary())
//                DAOFirebase.save(collection: "figurinhas", itemData: Figurinha(idDaFigurinha: 8, idDoDono: 2, foto: "fotoTaques3.jpeg", nome: "Taques3", frase: "fraseTaques3", interesse: "interesseTaques3", buscoNoEvento: "oQueTaques3Busca").mapToDictionary())
//
//                DAOFirebase.save(collection: "figurinhas", itemData: Figurinha(idDaFigurinha: 9, idDoDono: 1, foto: "fotoOtavio.jpeg", nome: "Otavio", frase: "fraseOtavio", interesse: "interesseOtavio", buscoNoEvento: "oQueOtavioBusca").mapToDictionary())
//                DAOFirebase.save(collection: "figurinhas", itemData: Figurinha(idDaFigurinha: 10, idDoDono: 1, foto: "fotoOtavio2.jpeg", nome: "Otavio2", frase: "fraseOtavio2", interesse: "interesseOtavio2", buscoNoEvento: "oQueOtavio2Busca").mapToDictionary())
//                DAOFirebase.save(collection: "figurinhas", itemData: Figurinha(idDaFigurinha: 11, idDoDono: 1, foto: "fotoOtavio3.jpeg", nome: "Otavio3", frase: "fraseOtavio3", interesse: "interesseOtavio3", buscoNoEvento: "oQueOtavio3Busca").mapToDictionary())
//
//
//                    // USUARIOS
//                        DAOFirebase.save(collection: "usuarios", itemData: Usuario(idDoUsuario: 1, idDasFigurinhas: [9, 10, 11], idDosAlbuns: [3, 4], nome: "Otavio", email: "otavio@icloud.com").mapToDictionary())
//                        DAOFirebase.save(collection: "usuarios", itemData: Usuario(idDoUsuario: 2, idDasFigurinhas: [6, 7, 8], idDosAlbuns: [5], nome: "Taques", email: "taques@icloud.com").mapToDictionary())
//                        DAOFirebase.save(collection: "usuarios", itemData: Usuario(idDoUsuario: 3, idDasFigurinhas: [3, 4, 5], idDosAlbuns: [1], nome: "Lary", email: "lary@icloud.com").mapToDictionary())
//                        DAOFirebase.save(collection: "usuarios", itemData: Usuario(idDoUsuario: 4, idDasFigurinhas: [1, 2], idDosAlbuns: [2], nome: "Yumi", email: "yumi@icloud.com").mapToDictionary())
//
//
//
//                    // EVENTOS
//                DAOFirebase.save(collection: "eventos", itemData: Evento(idDoEvento: 1, idDosAlbuns: [1, 2, 3, 4, 5], nomeDoEvento: "Evento 1", dataDoEvento: "20/11/2019", fotoDeCapa: "fotoEvento1.jpeg").mapToDictionary())
//
//                    // ALBUNS
//                DAOFirebase.save(collection: "albuns", itemData: Album(idDoAlbum: 1, idDoDono: 3, idDoEvento: 1, idDasFigurinhas: [1,2,3,4]).mapToDictionary())
//                DAOFirebase.save(collection: "albuns", itemData: Album(idDoAlbum: 2, idDoDono: 4, idDoEvento: 1, idDasFigurinhas: [5,6,7,8]).mapToDictionary())
//                DAOFirebase.save(collection: "albuns", itemData: Album(idDoAlbum: 3, idDoDono: 1, idDoEvento: 1, idDasFigurinhas: [9, 6, 4, 2]).mapToDictionary())
//                DAOFirebase.save(collection: "albuns", itemData: Album(idDoAlbum: 4, idDoDono: 1, idDoEvento: 1, idDasFigurinhas: [9,10,11]).mapToDictionary())
//                DAOFirebase.save(collection: "albuns", itemData: Album(idDoAlbum: 5, idDoDono: 2, idDoEvento: 1, idDasFigurinhas: [6]).mapToDictionary())
//
//        let uid = 1
//        DAOFirebase.loadUser(uid: uid) {
//            DAOFirebase.loadData(uid: uid) {
//                print("\n")
//                print("Usuario")
//                print(" - idDoUsario: \(Model.shared.usuario.idDoUsuario)")
//                print(" - nome: \(Model.shared.usuario.nome)")
//                print(" - email: \(Model.shared.usuario.email)")
//                print(" - idDasFigurinhas:  \(Model.shared.usuario.idDasFigurinhas)")
//                print(" - idDosAlbuns: \(Model.shared.usuario.idDosAlbuns)")
//                print("\n")
//                print("Figurinhas")
//                for figurinha in Model.shared.figurinhas {
//                    print(" - idFigurinha: \(figurinha.idDaFigurinha)")
//                    print(" - idDoDono: \(figurinha.idDoDono)")
//                    print(" - nome: \(figurinha.nome)")
//                    print(" - frase: \(figurinha.frase)")
//                    print(" - interesse: \(figurinha.interesse)")
//                    print(" - buscoNoEvento: \(figurinha.buscoNoEvento)")
//                    print("\n")
//                }
//                print("Albuns")
//                for album in Model.shared.albuns {
//                    print(" - idDoAlbum: \(album.idDoAlbum)")
//                    print(" - idDoDono: \(album.idDoDono)")
//                    print(" - idDoEvento: \(album.idDoEvento)")
//                    print(" - idDasFigurinhas: \(album.idDasFigurinhas)")
//                    print("\n")
//                }
//
//            }
//        }         ************** FIM_TESTE **************
        
        
          
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}





