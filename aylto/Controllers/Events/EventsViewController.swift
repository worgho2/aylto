import UIKit

class EventsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var eventsColletionView: UICollectionView!
    
    let selectionFeedback = UISelectionFeedbackGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.eventsColletionView.delegate = self
        self.eventsColletionView.dataSource = self
        self.eventsColletionView.register(UINib(nibName: "EventCoverCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "EventCoverCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = eventsColletionView.dequeueReusableCell(withReuseIdentifier: "EventCoverCell", for: indexPath) as! EventCoverCollectionViewCell
        cell.setup(title: "NOME", date: "20-20-2020", indexControl: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectionFeedback.selectionChanged()
        performSegue(withIdentifier: "GoToAddEventSegue", sender: nil)
    }
    

    

}
