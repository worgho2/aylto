import UIKit

extension UIImageView {
    
    func makeRounded() {
        self.layer.cornerRadius = self.frame.height / 2.0
        self.layer.masksToBounds = true
        self.layer.borderWidth = 5.0
    }
    
}
