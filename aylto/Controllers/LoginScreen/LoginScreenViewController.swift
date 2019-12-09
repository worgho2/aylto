import UIKit
import AuthenticationServices

class LoginScreenViewController: UIViewController {
    
    @IBOutlet weak var buttonView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        let appleButton = ASAuthorizationAppleIDButton()
        appleButton.translatesAutoresizingMaskIntoConstraints = false
        appleButton.addTarget(self, action: #selector(didTapAppleButton), for: .touchUpInside)
        
        view.addSubview(appleButton)
        NSLayoutConstraint.activate([
            appleButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
            appleButton.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            appleButton.widthAnchor.constraint(equalTo: buttonView.widthAnchor, multiplier: 0.9),
            appleButton.heightAnchor.constraint(equalTo: buttonView.heightAnchor, multiplier: 0.25)
        ])
    }
    
    @objc func didTapAppleButton() {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        
        controller.performRequests()
    }
    
}

extension LoginScreenViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let credentials as ASAuthorizationAppleIDCredential:
            loadData(credentials: credentials)
            performSegue(withIdentifier: "GoToEventsSegue", sender: nil)
            break
            
        default: break
            
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("vish, deu ruim: ", error)
    }
}


extension LoginScreenViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
}

func loadData(credentials: ASAuthorizationAppleIDCredential) {
//    for usuario in Model.shared.usuarios {
//        if usuario.idDoUsuario == credentials.user {
//            Model.shared.usuarioAtual = usuario
//        }
//    }
//    for album in Model.shared.albuns {
//        if album.idDoDono == Model.shared.usuarioAtual.idDoUsuario {
//            Model.shared.meusAlbuns.append(album)
//        }
//    }
//    for evento in Model.shared.eventos {
//        for album in Model.shared.albuns {
//            if evento.idDoEvento == album.idDoEvento {
//                Model.shared.meusEventos.append(evento)
//            }
//        }
//    }
}
