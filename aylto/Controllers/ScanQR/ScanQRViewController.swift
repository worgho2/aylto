import UIKit

struct QRData {
    var codeString: String?
}

class ScanQRViewController: UIViewController {
    
    @IBOutlet weak var scanQRView: UIView!
    @IBOutlet weak var scanQRCancelButton: UIButton!
    @IBOutlet weak var scanQRImageView: UIImageView!
    @IBOutlet weak var scanQRNameLabel: UILabel!
    @IBOutlet weak var scanQRPhraseLabel: UILabel!
    
    @IBOutlet weak var qrCodeView: ScanQRView!
    
    let scanQRViewGrayColor = UIColor(red: 224.0/255.0, green: 224.0/255.0, blue: 224.0/255.0, alpha: 1)
    
    var qrData: QRData? = nil {
        didSet {
            if qrData != nil {
                self.presentAlert(withTitle: "Success", message: qrData!.codeString!)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupButtons()
        self.setupQrCodeView()
    }
    
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.animateView()

        if !qrCodeView.isRunning {
            qrCodeView.startScanning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if !qrCodeView.isRunning {
            qrCodeView.stopScanning()
        }
    }
    
    func setupView() {
        scanQRView.layer.cornerRadius = 15
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
    
    func setupButtons() {
        scanQRCancelButton.addBorder(side: .Top, color: scanQRViewGrayColor, width: 1)
    }
    
    func setupQrCodeView() {
        qrCodeView.delegate = self
    }
    
    func animateView() {
        scanQRView.alpha = 0;
        self.scanQRView.frame.origin.y = self.scanQRView.frame.origin.y + 50
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.scanQRView.alpha = 1.0;
            self.scanQRView.frame.origin.y = self.scanQRView.frame.origin.y - 50
        })
    }
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


extension ScanQRViewController: ScanQRViewDelegate {
    func qrScanningDidStop() {
    }
    
    func qrScanningDidFail() {
        presentAlert(withTitle: "Error", message: "Scanning Failed. Please try again")
    }
    
    func qrScanningSucceededWithCode(_ str: String?) {
        self.qrData = QRData(codeString: str)
    }
}
