import UIKit

class FigurinhaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var addEventAlbumButton: UIButton!
    @IBAction func buttonTApped(_ sender: Any) {
        print("OI")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let textLabel = UILabel(frame: .zero)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            textLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            textLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        ])
//        self.textLabel = textLabel
        
        self.contentView.backgroundColor = .lightGray
//        self.textLabel.textAlignment = .center
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
        
//        self.textLabel.text = nil
    }
    
    func pressAddEventAlbumButton() {
        
    }
}
