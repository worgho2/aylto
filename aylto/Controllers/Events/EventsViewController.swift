import UIKit

class EventsViewController: UIViewController {
    
    let isDebbug: Bool = false
    
    @IBOutlet weak var eventsColletionView: UICollectionView! {
        didSet {
            self.eventsColletionView.delegate = self
            self.eventsColletionView.dataSource = self
            self.eventsColletionView.register(UINib(nibName: "EventCoverCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "EventCoverCell")
        }
    }
        
    var filteredEvents = Model.shared.meusEventos
    
    let selectionFeedback = UISelectionFeedbackGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSearchBar()
    }
    
    func setupSearchBar() {
        self.navigationItem.searchController = UISearchController()
        self.navigationItem.searchController?.searchBar.delegate = self
        self.navigationItem.searchController?.searchBar.scopeButtonTitles = ["All", "Name", "Date"]
    }
}

extension EventsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredEvents.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = eventsColletionView.dequeueReusableCell(withReuseIdentifier: "EventCoverCell", for: indexPath) as! EventCoverCollectionViewCell
        cell.setup(title: filteredEvents.indices.contains(indexPath.item - 1) ? filteredEvents[indexPath.item -  1].nomeDoEvento : "", date: filteredEvents.indices.contains(indexPath.item - 1) ? filteredEvents[indexPath.item - 1].dataDoEvento : "", indexControl: indexPath.item)
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

extension EventsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchBar.selectedScopeButtonIndex)
        if !searchText.isEmpty {
            self.filteredEvents = Model.shared.meusEventos.filter({ event -> Bool in
                guard let text = searchBar.text else { return false }
                
                var occurrences = [Bool]()
                
                if searchBar.selectedScopeButtonIndex == 2 {
                    occurrences.append(String(event.dataDoEvento).lowercased().contains(String(text).lowercased()))
                } else if searchBar.selectedScopeButtonIndex == 1 {
                    occurrences.append(String(event.nomeDoEvento).lowercased().contains(String(text).lowercased()))
                } else {
                    occurrences.append(String(event.dataDoEvento).lowercased().contains(String(text).lowercased()))
                    occurrences.append(String(event.nomeDoEvento).lowercased().contains(String(text).lowercased()))
                }
                
                return occurrences.contains(true)
            })
            self.eventsColletionView.reloadData()
        } else {
            self.filteredEvents = Model.shared.meusEventos
            self.eventsColletionView.reloadData()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        self.searchBar(searchBar, textDidChange: searchBar.text!)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        self.searchBar(searchBar, textDidChange: searchBar.text!)
        self.view.endEditing(true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
}
