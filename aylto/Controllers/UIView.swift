import UIKit

extension UIView {
    func roundCorners(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func setGradientBackground( colorTop: UIColor, colorBottom: UIColor) {
        removeSubLayer(name: "GradientBackground")
        let gradientLayer = CAGradientLayer()
        gradientLayer.name = "GradientBackground"
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds
        
        layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    func setGradientBackgroundVertical( colorTop: UIColor, colorBottom: UIColor) {
        removeSubLayer(name: "GradientBackground")
        let gradientLayer = CAGradientLayer()
        gradientLayer.name = "GradientBackground"
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds
        
        layer.insertSublayer(gradientLayer, at: 0)
        
    }
    func removeSubLayer(name:String){
        guard let sub = layer.sublayers else { return }
        for layer in sub {
            if layer.name == name {
                layer.removeFromSuperlayer()
            }
        }
    }
    
    func standartStyle(_ radius: CGFloat, _ color: UIColor, _ x: CGFloat, _ y: CGFloat){
        self.layer.cornerRadius = radius
        self.backgroundColor = color
        self.layer.shadowColor = color.cgColor
        self.layer.shadowPath = UIBezierPath(roundedRect: CGRect(x: x, y: y, width: self.frame.width, height: self.frame.height), cornerRadius: radius).cgPath
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 2.0
    }
}
