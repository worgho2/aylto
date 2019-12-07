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

    @IBAction func skipButtonTapped(sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
        self.performSegue(withIdentifier: "GoToHomeSegue", sender: nil)

    }
    
    @IBAction func nextButtonTapped(sender: UIButton) {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                walkthroughPageViewController?.forwardPage()
            case 2:
                UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
                self.performSegue(withIdentifier: "GoToHomeSegue", sender: nil)
            default: break
            }
        }
        
        updateUI()
    }
    
    func updateUI() {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
                case 0...1:
                    nextButton.setTitle("NEXT", for: .normal)
                    skipButton.isHidden = false
                case 2:
                    nextButton.setTitle("GET STARTED", for: .normal)
                    skipButton.isHidden = true
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
