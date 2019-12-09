import UIKit

class ParticipantCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iceCoverImageView: UIImageView!
    @IBOutlet weak var participantImageView: UIImageView!
    @IBOutlet weak var participantNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(isItFrozen: Bool, image: UIImage, name: String) {
        self.iceCoverImageView.image = UIImage(named: isItFrozen ? "COVER FROZEN" : "COVER NORMAL")
        self.participantImageView.image = image
        self.participantNameLabel.text = name
    }

}
