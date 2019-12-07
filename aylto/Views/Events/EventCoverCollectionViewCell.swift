import UIKit

@IBDesignable
class EventCoverCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var cellDateLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(title: String, date: String, indexControl: Int) {
        self.cellTitleLabel.text = indexControl == 0 ? "" : title
        self.cellDateLabel.text = indexControl == 0 ? "" : date
        self.cellImageView.image = UIImage(named: indexControl == 0 ? "EventCoverAdd" : "EventCover")
        
    }

}
