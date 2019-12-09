import UIKit

class EventsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let isDebbug: Bool = false
    
    @IBOutlet weak var eventsColletionView: UICollectionView!
    
    let selectionFeedback = UISelectionFeedbackGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.eventsColletionView.delegate = self
        self.eventsColletionView.dataSource = self
        self.eventsColletionView.register(UINib(nibName: "EventCoverCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "EventCoverCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Model.shared.meusAlbuns.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = eventsColletionView.dequeueReusableCell(withReuseIdentifier: "EventCoverCell", for: indexPath) as! EventCoverCollectionViewCell
        
        cell.setup(title: Model.shared.meusEventos[indexPath.item].nomeDoEvento, date: Model.shared.meusEventos[indexPath.item].dataDoEvento, indexControl: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectionFeedback.selectionChanged()

        
        if indexPath.item == 0 || isDebbug {
            performSegue(withIdentifier: "GoToAddEventSegue", sender: nil)
        } else {
            performSegue(withIdentifier: "GoToEventAlbumSegue", sender: nil)
        }
    }
    

    

}
