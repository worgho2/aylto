import UIKit

extension UIView {
    
    func roundCorners(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
}
