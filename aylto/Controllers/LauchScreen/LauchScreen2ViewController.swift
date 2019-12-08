import UIKit

class TesteViewController: UIViewController {
    
    var alwaysShowOnboarding = false
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        UIView.transition(with: self.nameLabel, duration: 2, options: .transitionCrossDissolve, animations: {
            self.nameLabel.textColor = .white
        }, completion: nil)
        
        UIView.transition(with: self.view, duration: 4, options: .transitionCrossDissolve, animations: {
            self.view.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1)
        }, completion: nil)
    }
}

