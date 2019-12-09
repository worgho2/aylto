import UIKit

protocol WalkthroughPageViewControllerDelegate: class {
    func didUpdatePageIndex(currentIndex: Int)
}

class WalkthroughViewController: UIViewController, WalkthroughPageViewControllerDelegate {
    
    weak var walkthroughDelegate: WalkthroughPageViewControllerDelegate?
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = 10.0
            nextButton.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var skipButton: UIButton!
    
    var walkthroughPageViewController: WalkthroughPageViewController?
    
    let selectionFeedback = UISelectionFeedbackGenerator()

    @IBAction func skipButtonTapped(sender: UIButton) {
        selectionFeedback.selectionChanged()
        UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
        self.performSegue(withIdentifier: "GoToEventsSegue", sender: nil)

    }
    
    @IBAction func nextButtonTapped(sender: UIButton) {
        selectionFeedback.selectionChanged()
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                walkthroughPageViewController?.forwardPage()
            case 2:
                UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
                self.performSegue(withIdentifier: "GoToEventsSegue", sender: nil)
            default: break
            }
        }
        
        updateUI()
    }
    
    func updateUI() {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
                case 0,1:
                    UIView.animate(withDuration: 0.1, animations: {
                        self.nextButton.setTitleColor(#colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1), for: .normal)
                    }) { _ in
                        self.nextButton.setTitle("NEXT", for: .normal)
                        UIView.animate(withDuration: 0.4) {
                            self.nextButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
                            self.skipButton.isEnabled = true
                            self.skipButton.alpha = 1
                        }
                    }
                case 2:
                    UIView.animate(withDuration: 0.1, animations: {
                        self.nextButton.setTitleColor(#colorLiteral(red: 0.3333333333, green: 0.4980392157, blue: 0.9450980392, alpha: 1), for: .normal)
                    }) { _ in
                        self.nextButton.setTitle("GET STARTED", for: .normal)
                        UIView.animate(withDuration: 0.4) {
                            self.nextButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
                            self.skipButton.isEnabled = false
                            self.skipButton.alpha = 0
                        }
                    }
                default: break
            }
            pageControl.currentPage = index
        }
    }
    
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? WalkthroughPageViewController {
            walkthroughPageViewController = pageViewController
            walkthroughPageViewController?.walkthroughDelegate = self
        }
    }
}
