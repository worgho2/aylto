//o taques disse que vai fazer
import UIKit

class EventAlbumViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phraseTextField: UITextView!
    @IBOutlet weak var personsOnEventTextField: UITextField!
    @IBOutlet weak var personsConnectedTextField: UITextField!
    @IBOutlet weak var personsNotConnectedTextField: UITextField!
    @IBOutlet weak var albumCoverView: UIView!
    @IBOutlet weak var albumCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        albumCollectionView.delegate = self
        albumCollectionView.dataSource = self
        profilePicture.makeRounded()
        
        albumCollectionView.register(UINib(nibName: "ParticipantCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ParticipantCell")
        
        // Do any additional setup after loading the view.
        // Teste  do gitkraken
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "GoToCardDetailSegue", sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = albumCollectionView.dequeueReusableCell(withReuseIdentifier: "ParticipantCell", for: indexPath) as! ParticipantCollectionViewCell
        
//        cell.testeVIew.image  =  UIImage(named: "teste")
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = albumCollectionView.frame.width / 2
        let height = (albumCollectionView.frame.height - 100) / 2
        print("WIDTH \(width)")
        print("HEIGHT \(height)")
        return CGSize(width: width - 30, height: height - 15)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
      // 1
      switch kind {
      // 2
      case UICollectionView.elementKindSectionHeader:
        // 3
        guard
          let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(AlbumCollectionReusableView.self)", for: indexPath) as? AlbumCollectionReusableView
          else {
            fatalError("Invalid view type")
        }

        //let searchTerm = searches[indexPath.section].searchTerm
        //headerView.label.text = searchTerm
        return headerView
        
      case UICollectionView.elementKindSectionFooter:
        // 3
        guard
          let footerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: "FooterCollectionReusableView",
            for: indexPath) as? FooterCollectionReusableView
          else {
            fatalError("Invalid view type")
        }

        //let searchTerm = searches[indexPath.section].searchTerm
        //headerView.label.text = searchTerm
        return footerView
      default:
        // 4
        assert(false, "Invalid element type")
      }
        
    }

}
