import UIKit
import AVFoundation

protocol QRCodeReaderDelegate{
    func onRead(data: String)
}

class ScannerView: UIView, AVCaptureMetadataOutputObjectsDelegate {
    
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var delegate: QRCodeReaderDelegate?
    
    override init(frame:  CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func bruteforce_appear() {
        
        if (captureSession?.isRunning == false) {
            captureSession.startRunning()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        //        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit(){
        
        self.backgroundColor = UIColor.blue
        captureSession = AVCaptureSession()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            failed()
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = self.frame
        //        previewLayer.videoGravity = .resize
        self.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()
    }
    
    func failed() {
        
    }
    
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        //        captureSession.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: stringValue)
        }
        
        //        dismiss(animated: true)
    }
    
    func found(code: String) {
        print(code)
        self.captureSession.stopRunning()
        self.delegate?.onRead(data: code)
    }
    
    //    override var prefersStatusBarHidden: Bool {
    //        return true
    //    }
    //
    //    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    //        return .portrait
    //    }
    
}
