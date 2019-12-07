import UIKit

class FigurinhaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var addEventAlbumButton: UIButton!
    @IBAction func buttonTApped(_ sender: Any) {
        print("OI")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .lightGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("Interface Builder is not supported!")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fatalError("Interface Builder is not supported!")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
