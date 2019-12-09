import UIKit

class AddEventViewController: UIViewController {
        
    @IBOutlet var fields: Array<UITextField>!
    @IBOutlet weak var insertEventCodeHereView: UIView!
    @IBOutlet weak var successLabel: UILabel!
    @IBOutlet weak var createCardButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    let notification = UINotificationFeedbackGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for field in fields {
            field.keyboardType = .numberPad
            field.roundCorners(radius: 4.0)
        }
    
        insertEventCodeHereView.roundCorners(radius: 40.0)
        fields.first?.layer.borderWidth = 1
        fields.first?.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        self.successLabel.isHidden = true
        self.createCardButton.isHidden = true
        self.createCardButton.isEnabled = false
        self.createCardButton.layer.cornerRadius = 10.0
    }
    
    @IBAction func onCreateCard(_ sender: Any) {
        self.performSegue(withIdentifier: "GoToCreateCardSegue", sender: nil)
    }
    

    @IBAction func dismissAddEvent(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fields.first?.becomeFirstResponder()
    }
    
    func animateView() {
        insertEventCodeHereView.alpha = 0;
        self.insertEventCodeHereView.frame.origin.y = self.insertEventCodeHereView.frame.origin.y + 50
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.insertEventCodeHereView.alpha = 1.0;
            self.insertEventCodeHereView.frame.origin.y = self.insertEventCodeHereView.frame.origin.y - 50
        })
    }
        
    @IBAction func textChanged(_ sender: UITextField) {
        let nextIndex = sender.tag + 1
        fields[nextIndex].becomeFirstResponder()
        fields[nextIndex].layer.borderWidth = 1
        fields[nextIndex].layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        fields[sender.tag].layer.borderWidth = 0
    }
    
    @IBAction func checkCode(_ sender: Any) {
        var code: String = ""
        fields.forEach( { code.append($0.text!) } )
        
        if code == "111111" || true {
            notification.notificationOccurred(.success)
            view.endEditing(true)
            
            self.fields.forEach( { $0.isHidden = true } )
            UIView.animate(withDuration: 0.2, animations: {
                self.titleLabel.alpha = 0.0
                
            }) { _ in
                UIView.animate(withDuration: 0.0001, animations: {
                    self.titleLabel.text = "cool, now it's time to:"
                }) { _ in
                    UIView.animate(withDuration: 0.2) {
                        self.titleLabel.alpha = 1.0
                        self.successLabel.isHidden = false
                        self.createCardButton.isHidden = false
                        self.createCardButton.isEnabled = true
                    }
                }
            }
        } else {
            notification.notificationOccurred(.error)
            fields.forEach( { $0.text = "" } )
            fields.first?.becomeFirstResponder()
        }
    }

}

