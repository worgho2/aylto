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
    
    @IBOutlet weak var albumCollectionView: UICollectionView! {
        didSet {
            self.albumCollectionView.delegate = self
            self.albumCollectionView.dataSource = self
            self.albumCollectionView.register(UINib(nibName: "ParticipantCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ParticipantCell")
            self.albumCollectionView.register(UINib(nibName: "CollectionHeaderReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerReusableView")
            self.albumCollectionView.register(UINib(nibName: "CollectionFooterReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footerReusableView")
        }
    }
    
    var myCard: Bool = false
    var indexCard: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        
        Model.shared.dataObservers.append(self)
        self.albumCoverView.layer.shadowColor = UIColor.lightGray.cgColor
        self.albumCoverView.layer.shadowOpacity = 0.3
        self.albumCoverView.layer.shadowOffset = .zero
        self.albumCoverView.layer.shadowRadius = 10
        
    }
    
    
    
    func setupView() {
        albumImageView.clipsToBounds = true
        albumImageView.layer.cornerRadius = (albumImageView.frame.width + albumImageView.frame.height) / 4
        albumImageView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.7856478217, alpha: 0.4347174658)
        albumImageView.image = Model.shared.figurinhaAtual?.foto
        albumImageView.contentMode = .scaleAspectFill
        
        albumShowMyCardButton.layer.cornerRadius = 10.0
    }

    @IBAction func onShowMyCard(_ sender: Any) {
        myCard = true
        performSegue(withIdentifier: "GoToCardDetailSegue", sender: nil)
    }
    
    @IBAction func onSwapButton(_ sender: Any) {
        self.showQRCodeOptions()
    }
    
    @IBAction func onHomeButton(_ sender: Any) {
        performSegue(withIdentifier: "GoToEventsSegue", sender: nil)
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
    
}

extension EventAlbumViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, ObserverDelegate {
    
    func notify() {
        albumCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 50, height: 100)
    }
    
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
        cell.backgroundColor = #colorLiteral(red: 0.9551764131, green: 0.9553362727, blue: 0.9551554322, alpha: 1)
        let figurinhaAtual = Model.shared.figurinhas[indexPath.row]
        cell.participantNameLabel.text = figurinhaAtual.nome
        if Model.shared.figurinhas[indexPath.row].isCongelado == true {
            cell.participantImageView.image = figurinhaAtual.fotoCongelada
            cell.iceCoverImageView.alpha = 0.8
        } else {
            UIView.transition(with: cell.iceCoverImageView, duration: 2.5, options: .curveEaseOut, animations: {
                cell.iceCoverImageView.alpha = 0
            })

            UIView.transition(with: cell.participantImageView, duration: 2, options: .curveEaseIn, animations: {
                cell.participantImageView.image = figurinhaAtual.foto
            })
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = albumCollectionView.frame.width / 2
        let height = (albumCollectionView.frame.height - 40) / 2
        return CGSize(width: width - 30, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerReusableView", for: indexPath) as! CollectionHeaderReusableView
            headerView.setup()
            headerView.layer.shadowColor = UIColor.lightGray.cgColor
            headerView.layer.shadowOpacity = 0.6
            headerView.layer.shadowOffset = .zero
            headerView.layer.shadowRadius = 10
            return headerView
        } else if kind == UICollectionView.elementKindSectionFooter{
            print("vai mostrar o footer")
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footerReusableView", for: indexPath) as! CollectionFooterReusableView
            footerView.setup()
            footerView.layer.shadowColor = UIColor.lightGray.cgColor
            footerView.layer.shadowOpacity = 0.6
            footerView.layer.shadowOffset = .zero
            footerView.layer.shadowRadius = 10
            return footerView
        } else {
           let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footerReusableView", for: indexPath) as! CollectionFooterReusableView
            footerView.setup()
            return footerView
        }
        

    }
    
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
