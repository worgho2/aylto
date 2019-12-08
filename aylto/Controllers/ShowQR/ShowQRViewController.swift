import UIKit

class ShowQRViewController: UIViewController {
    
    @IBOutlet weak var showQRView: UIView!
    @IBOutlet weak var showQRCancelButton: UIButton!
    @IBOutlet weak var showQRImageView: UIImageView!
    @IBOutlet weak var showQRNameLabel: UILabel!
    @IBOutlet weak var showQRPhraseLabel: UILabel!

    @IBOutlet weak var qrCodeView: ShowQRView!
    
    let showQRViewGrayColor = UIColor(red: 224.0/255.0, green: 224.0/255.0, blue: 224.0/255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupButtons()
        self.setupQrCodeView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.animateView()
    }
    
    func setupView() {
        showQRView.layer.cornerRadius = 15
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
    
    func setupButtons() {
        showQRCancelButton.addBorder(side: .Top, color: showQRViewGrayColor, width: 1)
    }
    
    func setupQrCodeView() {
        qrCodeView.generateCode("texto aqui")
    }
    
    
    func animateView() {
        showQRView.alpha = 0;
        self.showQRView.frame.origin.y = self.showQRView.frame.origin.y + 50
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.showQRView.alpha = 1.0;
            self.showQRView.frame.origin.y = self.showQRView.frame.origin.y - 50
        })
    }
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
