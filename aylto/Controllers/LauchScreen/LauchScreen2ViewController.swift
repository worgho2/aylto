import UIKit

class TesteViewController: UIViewController {
    
    var alwaysShowOnboarding = true
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (timer) in
            if UserDefaults.standard.bool(forKey: "hasViewedWalkthrough") || self.alwaysShowOnboarding {
                let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
                if let walkthroughViewController = storyboard.instantiateViewController(withIdentifier: "WalkthroughViewController") as? WalkthroughViewController {
                    walkthroughViewController.modalPresentationStyle = .fullScreen
                    self.present(walkthroughViewController, animated: true)
                }
            } else {
                self.performSegue(withIdentifier: "GoToEventsSegue", sender: nil)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        AudioManager.shared.play(soundEffect: .freeze)
        
        UIView.transition(with: self.nameLabel, duration: 3, options: .transitionCrossDissolve, animations: {
            self.nameLabel.textColor = .white
        })
        
        UIView.transition(with: self.view, duration: 1, options: .curveEaseOut, animations: {
            self.view.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1)
        })
        
        UIView.animate(withDuration: 3) {
            self.backgroundImage.alpha = 1.0
        }
        
    }
    
    func setupView() {
        self.backgroundImage.image = UIImage(named: "ice_background")!
        self.backgroundImage.alpha = 0
        self.view.backgroundColor = .white
        self.nameLabel.textColor = #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1)
    }
}

