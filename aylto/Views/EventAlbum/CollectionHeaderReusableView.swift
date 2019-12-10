import UIKit

class CollectionHeaderReusableView: UICollectionReusableView {
    
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup() {
        self.view.layer.cornerRadius = 25
        
        self.view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        self.addSubview(self.view)
        
        self.view.backgroundColor = .white
    }
    
}
