import UIKit

class CardDetailViewController: UIViewController {
    
    var figurinhaAtual: Figurinha!
    
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
        self.animateView()
    }
    
    func animateView() {
        cardImageView.clipsToBounds = true
        cardImageView.layer.cornerRadius = (cardImageView.frame.width + cardImageView.frame.height) / 4
        cardImageView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        cardDetailView.alpha = 0;
        
        self.cardDetailView.frame.origin.y = self.cardDetailView.frame.origin.y + 50
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.cardDetailView.alpha = 1.0;
            self.cardDetailView.frame.origin.y = self.cardDetailView.frame.origin.y - 50
        })
    }
    
    func setupView() {
        cardDetailView.layer.cornerRadius = 15
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        self.cardNameLabel.text = self.figurinhaAtual.nome
        self.cardPhraseLabel.text = self.figurinhaAtual.frase
        self.cardImageView.image = self.figurinhaAtual.foto
        self.cardImageView.contentMode = .scaleAspectFill
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
        
        
        if Model.shared.figurinhaAtual!.onIntends.contains(0) {
            intendToNewJobButton.setImage(UIImage(named: "newjob_active")!, for: .normal)
        }
        if Model.shared.figurinhaAtual!.onIntends.contains(1) {
            intendToImARecruiterButton.setImage(UIImage(named: "imarecruiter_active")!, for: .normal)
        }
        if Model.shared.figurinhaAtual!.onIntends.contains(2) {
            intendToGivingATalkButton.setImage(UIImage(named: "givingatalk_active")!, for: .normal)
        }
        if Model.shared.figurinhaAtual!.onIntends.contains(3) {
            intendToBusinessTalkButton.setImage(UIImage(named: "businesstalk_active")!, for: .normal)
        }
        if Model.shared.figurinhaAtual!.onIntends.contains(4) {
            intendToHappyHourButton.setImage(UIImage(named: "happyhour_active")!, for: .normal)
        }
        if Model.shared.figurinhaAtual!.onIntends.contains(5) {
            intendToNeedAMentorButton.setImage(UIImage(named: "needamentor_active")!, for: .normal)
        }
        
        
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
    
    @IBAction func onContact(_ sender: Any) {
        showToast(message: "Coming Soon")
    }
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
