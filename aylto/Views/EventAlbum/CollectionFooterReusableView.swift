import UIKit

class CollectionFooterReusableView: UICollectionReusableView {

    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup() {
        self.view.layer.cornerRadius = 25
        
        self.view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        self.addSubview(self.view)
        
        self.view.backgroundColor = .black
    }
    
}
