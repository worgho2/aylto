import UIKit

class CardDatailViewController: UIViewController {
    
    @IBOutlet weak var cardDetailView: UIView!
    
    @IBOutlet weak var cardCancelButton: UIButton!
    @IBOutlet weak var cardContactButton: UIButton!
    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var cardNameLabel: UILabel!
    @IBOutlet weak var cardPhraseLabel: UILabel!
    
    @IBOutlet weak var interestInDesignButton: UIButton!
    @IBOutlet weak var interestInCodingButton: UIButton!
    @IBOutlet weak var interesInBusinessButton: UIButton!
    @IBOutlet weak var interesInArtButton: UIButton!
    @IBOutlet weak var interestInSportsButton: UIButton!
    
    var isInterestInDesignButtonActive: Bool!
    var isInterestInCodingButtonActive: Bool!
    var isInteresInBusinessButtonActive: Bool!
    var isInteresInArtButtonActive: Bool!
    var isInterestInSportsButtonActive: Bool!
    
    @IBOutlet weak var intendToNewJobButton: UIButton!
    @IBOutlet weak var intendToImARecruiterButton: UIButton!
    @IBOutlet weak var intendToGivingATalkButton: UIButton!
    @IBOutlet weak var intendToBusinessTalkButton: UIButton!
    @IBOutlet weak var intendToHappyHourButton: UIButton!
    @IBOutlet weak var intendToNeedAMentorButton: UIButton!
    
    var isIntendToNewJobButtonActive: Bool!
    var isIntendToImARecruiterButtonActive: Bool!
    var isIntendToGivingATalkButtonActive: Bool!
    var isIntendToBusinessTalkButtonActive: Bool!
    var isIntendToHappyHourButtonActive: Bool!
    var isIntendToNeedAMentorButtonActive: Bool!
    
    @IBOutlet weak var intendToNewJobLabel: UILabel!
    @IBOutlet weak var intendToImARecruiterLabel: UILabel!
    @IBOutlet weak var intendToGivingATalkLabel: UILabel!
    @IBOutlet weak var intendToBusinessTalkLabel: UILabel!
    @IBOutlet weak var intendToHappyHourLabel: UILabel!
    @IBOutlet weak var intendToNeedAMentorLabel: UILabel!
    
    let cardDetailViewGrayColor = UIColor(red: 224.0/255.0, green: 224.0/255.0, blue: 224.0/255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupButtons()
        self.setupIntends()
        self.setupInterests()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupView() {
        cardDetailView.layer.cornerRadius = 15
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
    
    func setupButtons() {
        cardCancelButton.addBorder(side: .Top, color: cardDetailViewGrayColor, width: 1)
        cardCancelButton.addBorder(side: .Right, color: cardDetailViewGrayColor, width: 1)
        cardContactButton.addBorder(side: .Top, color: cardDetailViewGrayColor, width: 1)
    }
    
    func setupIntends() {
        isIntendToNewJobButtonActive = false
        isIntendToImARecruiterButtonActive = false
        isIntendToGivingATalkButtonActive = false
        isIntendToBusinessTalkButtonActive = false
        isIntendToHappyHourButtonActive = false
        isIntendToNeedAMentorButtonActive = false
        
        intendToNewJobButton.isUserInteractionEnabled = false
        intendToImARecruiterButton.isUserInteractionEnabled = false
        intendToGivingATalkButton.isUserInteractionEnabled = false
        intendToBusinessTalkButton.isUserInteractionEnabled = false
        intendToHappyHourButton.isUserInteractionEnabled = false
        intendToNeedAMentorButton.isUserInteractionEnabled = false
        
        intendToNewJobButton.setImage(UIImage(named: "newjob")!, for: .normal)
        intendToImARecruiterButton.setImage(UIImage(named: "imarecruiter")!, for: .normal)
        intendToGivingATalkButton.setImage(UIImage(named: "givingatalk")!, for: .normal)
        intendToBusinessTalkButton.setImage(UIImage(named: "businesstalk")!, for: .normal)
        intendToHappyHourButton.setImage(UIImage(named: "happyhour")!, for: .normal)
        intendToNeedAMentorButton.setImage(UIImage(named: "needamentor")!, for: .normal)
        
        intendToNewJobLabel.textColor = #colorLiteral(red: 0.4509803922, green: 0.4509803922, blue: 0.4509803922, alpha: 1)
        intendToImARecruiterLabel.textColor = #colorLiteral(red: 0.4509803922, green: 0.4509803922, blue: 0.4509803922, alpha: 1)
        intendToGivingATalkLabel.textColor = #colorLiteral(red: 0.4509803922, green: 0.4509803922, blue: 0.4509803922, alpha: 1)
        intendToBusinessTalkLabel.textColor = #colorLiteral(red: 0.4509803922, green: 0.4509803922, blue: 0.4509803922, alpha: 1)
        intendToHappyHourLabel.textColor = #colorLiteral(red: 0.4509803922, green: 0.4509803922, blue: 0.4509803922, alpha: 1)
        intendToNeedAMentorLabel.textColor = #colorLiteral(red: 0.4509803922, green: 0.4509803922, blue: 0.4509803922, alpha: 1)
    }
    
    func setupInterests() {
        isInterestInDesignButtonActive = false
        isInterestInCodingButtonActive = false
        isInteresInBusinessButtonActive = false
        isInteresInArtButtonActive = false
        isInterestInSportsButtonActive = false
        
        interestInDesignButton.isUserInteractionEnabled = false
        interestInCodingButton.isUserInteractionEnabled = false
        interesInBusinessButton.isUserInteractionEnabled = false
        interesInArtButton.isUserInteractionEnabled = false
        interestInSportsButton.isUserInteractionEnabled = false
        
        interestInDesignButton.layer.borderWidth = 1
        interestInCodingButton.layer.borderWidth = 1
        interesInBusinessButton.layer.borderWidth = 1
        interesInArtButton.layer.borderWidth = 1
        interestInSportsButton.layer.borderWidth = 1
        
        interestInDesignButton.layer.cornerRadius = 5.0
        interestInCodingButton.layer.cornerRadius = 5.0
        interesInBusinessButton.layer.cornerRadius = 5.0
        interesInArtButton.layer.cornerRadius = 5.0
        interestInSportsButton.layer.cornerRadius = 5.0
        
        interestInDesignButton.layer.borderColor = #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1)
        interestInCodingButton.layer.borderColor = #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1)
        interesInBusinessButton.layer.borderColor = #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1)
        interesInArtButton.layer.borderColor = #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1)
        interestInSportsButton.layer.borderColor = #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1)
        
        interestInDesignButton.backgroundColor = .white
        interestInCodingButton.backgroundColor = .white
        interesInBusinessButton.backgroundColor = .white
        interesInArtButton.backgroundColor = .white
        interestInSportsButton.backgroundColor = .white
    }
    
    func animateView() {
        
    }
    
    
    
    
    @IBAction func onContact(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}




//class CustomAlertView: UIViewController {
//
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var messageLabel: UILabel!
//    @IBOutlet weak var alertTextField: UITextField!
//    @IBOutlet weak var alertView: UIView!
//    @IBOutlet weak var cancelButton: UIButton!
//    @IBOutlet weak var okButton: UIButton!
//    @IBOutlet weak var segmentedControl: UISegmentedControl!
//
//    var delegate: CustomAlertViewDelegate?
//    var selectedOption = "First"
//    let alertViewGrayColor = UIColor(red: 224.0/255.0, green: 224.0/255.0, blue: 224.0/255.0, alpha: 1)
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        alertTextField.becomeFirstResponder()
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        setupView()
//        animateView()
//        cancelButton.addBorder(side: .Top, color: alertViewGrayColor, width: 1)
//        cancelButton.addBorder(side: .Right, color: alertViewGrayColor, width: 1)
//        okButton.addBorder(side: .Top, color: alertViewGrayColor, width: 1)
//    }
//
//    func setupView() {
//        alertView.layer.cornerRadius = 15
//        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
//    }
//
//    func animateView() {
//        alertView.alpha = 0;
//        self.alertView.frame.origin.y = self.alertView.frame.origin.y + 50
//        UIView.animate(withDuration: 0.4, animations: { () -> Void in
//            self.alertView.alpha = 1.0;
//            self.alertView.frame.origin.y = self.alertView.frame.origin.y - 50
//        })
//    }
//
//    @IBAction func onTapCancelButton(_ sender: Any) {
//        alertTextField.resignFirstResponder()
//        delegate?.cancelButtonTapped()
//        self.dismiss(animated: true, completion: nil)
//    }
//
//    @IBAction func onTapOkButton(_ sender: Any) {
//        alertTextField.resignFirstResponder()
//        delegate?.okButtonTapped(selectedOption: selectedOption, textFieldValue: alertTextField.text!)
//        self.dismiss(animated: true, completion: nil)
//    }
//

//}
