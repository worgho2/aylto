import UIKit

class ShowQRView: UIView {
    lazy var filter = CIFilter(name: "CIQRCodeGenerator")
    lazy var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    init() {
        super.init(frame: .zero)
        self.commonInit()
    }
    
    func commonInit() {
        self.addSubview(imageView)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
    
    func generateCode(_ string: String, foregroundColor: UIColor = .black, backgroundColor: UIColor = .white) {
        guard let filter = filter,
            let data = string.data(using: .isoLatin1, allowLossyConversion: false) else {
                return
        }
        
        filter.setValue(data, forKey: "inputMessage")
        
        guard let ciImage = filter.outputImage else {
            return
        }
        
        let transformed = ciImage.transformed(by: CGAffineTransform.init(scaleX: 10, y: 10))
        let invertFilter = CIFilter(name: "CIColorInvert")
        invertFilter?.setValue(transformed, forKey: kCIInputImageKey)
        
        let alphaFilter = CIFilter(name: "CIMaskToAlpha")
        alphaFilter?.setValue(invertFilter?.outputImage, forKey: kCIInputImageKey)
        
        if let outputImage = alphaFilter?.outputImage  {
            imageView.tintColor = foregroundColor
            imageView.backgroundColor = backgroundColor
            imageView.image = UIImage(ciImage: outputImage, scale: 2.0, orientation: .up)
                .withRenderingMode(.alwaysTemplate)
        }
    }
}
