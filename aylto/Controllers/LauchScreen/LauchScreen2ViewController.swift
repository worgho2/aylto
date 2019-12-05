import UIKit

class TesteViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
            self.performSegue(withIdentifier: "GoToHomeSegue", sender: nil)
        }
    }

}
