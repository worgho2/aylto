//página critica
import UIKit

class EventAlbumViewController: UIViewController {

    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumNameLabel: UILabel!
    
    @IBOutlet weak var albumPeopleAtTheEventLabel: UILabel!
    @IBOutlet weak var albumPeopleIFoundLabel: UILabel!
    @IBOutlet weak var albumPeopleIDidntFindLabel: UILabel!
    
    @IBOutlet weak var albumNumberOfPeopleAtTheEventLabel: UILabel!
    @IBOutlet weak var albumNumberOfPeopleIFoundLabel: UILabel!
    @IBOutlet weak var albumNumberOfPeopleIDidntFindLabel: UILabel!
    
    @IBOutlet weak var albumShowMyCardButton: UIButton!
    
    @IBOutlet weak var albumCoverView: UIView!
    @IBOutlet weak var albumCollectionView: UICollectionView!
    
    var myCard: Bool = false
    var indexCard: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        albumCollectionView.delegate = self
        albumCollectionView.dataSource = self
        albumCollectionView.register(UINib(nibName: "ParticipantCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ParticipantCell")
    }
    
    
    
    func setupView() {
        albumImageView.clipsToBounds = true
        albumImageView.layer.cornerRadius = (albumImageView.frame.width + albumImageView.frame.height) / 4
        albumImageView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.7856478217, alpha: 0.4347174658)
        
        albumShowMyCardButton.layer.cornerRadius = 10.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToCardDetailSegue" {
            if let vc = segue.destination as? CardDetailViewController {
                if self.myCard {
                    vc.figurinhaAtual = Model.shared.figurinhaAtual
                } else {
                    vc.figurinhaAtual = Model.shared.figurinhas[self.indexCard]
                }
                
            }
        }
    }
    
    
    @IBAction func onShowMyCard(_ sender: Any) {
        myCard = true
        performSegue(withIdentifier: "GoToCardDetailSegue", sender: nil)
    }
    
    @IBAction func onSwapButton(_ sender: Any) {
        self.showQRCodeOptions()
    }
    
    @IBAction func onHomeButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: false)
    }
    
}

extension EventAlbumViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        myCard = false
        indexCard = indexPath.row
        performSegue(withIdentifier: "GoToCardDetailSegue", sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Model.shared.figurinhas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = albumCollectionView.dequeueReusableCell(withReuseIdentifier: "ParticipantCell", for: indexPath) as! ParticipantCollectionViewCell
        let figurinhaAtual = Model.shared.figurinhas[indexPath.row]
        cell.participantImageView.image = figurinhaAtual.fotoCongelada
        cell.participantNameLabel.text = figurinhaAtual.nome
        cell.iceCoverImageView.alpha = 0.8
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = albumCollectionView.frame.width / 2
        let height = (albumCollectionView.frame.height - 100) / 2
        return CGSize(width: width - 30, height: height - 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch kind {
            case UICollectionView.elementKindSectionHeader:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(AlbumCollectionReusableView.self)", for: indexPath) as? AlbumCollectionReusableView else {
                fatalError("Invalid view type")
                }
                return headerView

            case UICollectionView.elementKindSectionFooter:
                guard let footerView = collectionView.dequeueReusableSupplementaryView( ofKind: kind, withReuseIdentifier: "FooterCollectionReusableView", for: indexPath) as? FooterCollectionReusableView else {
                fatalError("Invalid view type")
                }
                return footerView

            default:
                assert(false, "Invalid element type")
        }
        
    }
    
//    func setupView() {
//        albumImageView.clipsToBounds = true
//        albumImageView.layer.cornerRadius = (albumImageView.frame.width + albumImageView.frame.height) / 4
//        albumImageView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.7856478217, alpha: 0.4347174658)
//        
//        albumShowMyCardButton.layer.cornerRadius = 10.0
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "GoToCardDetailSegue" {
//            if let vc = segue.destination as? CardDetailViewController {
//                if self.myCard {
//                    vc.figurinhaAtual = Model.shared.figurinhaAtual
//                } else {
//                    vc.figurinhaAtual = Model.shared.figurinhas[self.indexCard]
//                    
//                }
//                
//            }
//        }
//    }
//    
//    
//    @IBAction func onShowMyCard(_ sender: Any) {
//        myCard = true
//        performSegue(withIdentifier: "GoToCardDetailSegue", sender: nil)
//    }
//    
//    @IBAction func onSwapButton(_ sender: Any) {
//        self.showQRCodeOptions()
//    }
//    
//    @IBAction func onHomeButton(_ sender: Any) {
//        self.navigationController?.popToRootViewController(animated: false)
//    }
    
}

extension EventAlbumViewController {
    
    func showQRCodeOptions() {
        let scanAction = UIAlertController(title: "Choose an Option", message: nil, preferredStyle: .actionSheet)
        
        scanAction.addAction(UIAlertAction(title: "Scan QRCode", style: .default , handler: { _ in
            self.performSegue(withIdentifier: "GoToScanQRCodeSegue", sender: nil)
        }))
        
        scanAction.addAction(UIAlertAction(title: "Show QRCode", style: .default, handler: { _ in
            self.performSegue(withIdentifier: "GoToShowQRCodeSegue", sender: nil)
        }))
        
        scanAction.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(scanAction, animated: true)
    }
    
}
