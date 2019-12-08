import UIKit

class CreateCardViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    
    @IBOutlet weak var phraseTextField: UITextField!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupPhraseTextField()
        self.setupIntends()
        self.setupInterests()
    }
    
    func setupPhraseTextField() {
        phraseTextField.delegate = self
        phraseTextField.layer.borderWidth = 1
        phraseTextField.layer.borderColor = #colorLiteral(red: 0.4509803922, green: 0.4509803922, blue: 0.4509803922, alpha: 1)
        phraseTextField.layer.cornerRadius = 5
        
    }
    
    func setupIntends() {
        isIntendToNewJobButtonActive = false
        isIntendToImARecruiterButtonActive = false
        isIntendToGivingATalkButtonActive = false
        isIntendToBusinessTalkButtonActive = false
        isIntendToHappyHourButtonActive = false
        isIntendToNeedAMentorButtonActive = false
        
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
    
    
    @IBAction func onIntendsButton(_ sender : UIButton) {
        view.endEditing(true)
        switch sender.tag {
            case 0:
                intendToNewJobButton.setImage(UIImage(named: isIntendToNewJobButtonActive ? "newjob" : "newjob_active")!, for: .normal)
                intendToNewJobLabel.textColor = isIntendToNewJobButtonActive ? #colorLiteral(red: 0.4509803922, green: 0.4509803922, blue: 0.4509803922, alpha: 1) : #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1)
                isIntendToNewJobButtonActive.toggle()
            case 1:
                intendToImARecruiterButton.setImage(UIImage(named: isIntendToImARecruiterButtonActive ? "imarecruiter" : "imarecruiter_active")!, for: .normal)
                intendToImARecruiterLabel.textColor = isIntendToImARecruiterButtonActive ? #colorLiteral(red: 0.4509803922, green: 0.4509803922, blue: 0.4509803922, alpha: 1) : #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1)
                isIntendToImARecruiterButtonActive.toggle()
            case 2:
                intendToGivingATalkButton.setImage(UIImage(named: isIntendToGivingATalkButtonActive ? "givingatalk" : "givingatalk_active")!, for: .normal)
                intendToGivingATalkLabel.textColor = isIntendToGivingATalkButtonActive ? #colorLiteral(red: 0.4509803922, green: 0.4509803922, blue: 0.4509803922, alpha: 1) : #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1)
                isIntendToGivingATalkButtonActive.toggle()
            case 3:
                intendToBusinessTalkButton.setImage(UIImage(named: isIntendToBusinessTalkButtonActive ? "businesstalk" : "businesstalk_active")!, for: .normal)
                intendToBusinessTalkLabel.textColor = isIntendToBusinessTalkButtonActive ? #colorLiteral(red: 0.4509803922, green: 0.4509803922, blue: 0.4509803922, alpha: 1) : #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1)
                isIntendToBusinessTalkButtonActive.toggle()
            case 4:
                intendToHappyHourButton.setImage(UIImage(named: isIntendToHappyHourButtonActive ? "happyhour" : "happyhour_active")!, for: .normal)
                intendToHappyHourLabel.textColor = isIntendToHappyHourButtonActive ? #colorLiteral(red: 0.4509803922, green: 0.4509803922, blue: 0.4509803922, alpha: 1) : #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1)
                isIntendToHappyHourButtonActive.toggle()
            case 5:
                intendToNeedAMentorButton.setImage(UIImage(named: isIntendToNeedAMentorButtonActive ? "needamentor" : "needamentor_active")!, for: .normal)
                intendToNeedAMentorLabel.textColor = isIntendToNeedAMentorButtonActive ? #colorLiteral(red: 0.4509803922, green: 0.4509803922, blue: 0.4509803922, alpha: 1) : #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1)
                isIntendToNeedAMentorButtonActive.toggle()
            default: break
        }
    }
    
    @IBAction func onInterestButton(_ sender: UIButton) {
        view.endEditing(true)
        switch sender.tag {
            case 0:
                interestInDesignButton.backgroundColor = isInteresInArtButtonActive ? .white : #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1)
                interestInDesignButton.setTitleColor(isInteresInArtButtonActive ? #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1) : .white, for: .normal)
                isInteresInArtButtonActive.toggle()
            case 1:
                interestInCodingButton.backgroundColor = isInterestInCodingButtonActive ? .white : #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1)
                interestInCodingButton.setTitleColor(isInterestInCodingButtonActive ? #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1) : .white, for: .normal)
                isInterestInCodingButtonActive.toggle()
            case 2:
                interesInBusinessButton.backgroundColor = isInteresInBusinessButtonActive ? .white : #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1)
                interesInBusinessButton.setTitleColor(isInteresInBusinessButtonActive ? #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1) : .white, for: .normal)
                isInteresInBusinessButtonActive.toggle()
            case 3:
                interesInArtButton.backgroundColor = isInteresInArtButtonActive ? .white : #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1)
                interesInArtButton.setTitleColor(isInteresInArtButtonActive ? #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1) : .white, for: .normal)
                isInteresInArtButtonActive.toggle()
            
            case 4:
                interestInSportsButton.backgroundColor = isInterestInSportsButtonActive ? .white : #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1)
                interestInSportsButton.setTitleColor(isInterestInSportsButtonActive ? #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1) : .white, for: .normal)
                isInterestInSportsButtonActive.toggle()
            default: break
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    @IBAction func onDone(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func tapGestureRecognizer(_ sender: Any) {
        view.endEditing(true)
    }
    

}