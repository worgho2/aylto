import UIKit

extension UIImageView {
    func makeRounded() {
        self.layer.cornerRadius = self.frame.height / 2.0
        self.layer.masksToBounds = true
        self.layer.borderWidth = 5.0
        self.layer.borderColor = #colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1)
    }
}
