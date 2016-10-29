import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flipView: FlipView!
    let compassView = CompassView()
    let degreesView = DegreesView(frame: CGRect.zero)
    private var compassIsShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flipView.addSubview(degreesView)
        flipView.addSubview(compassView)
        compassView.isHidden = true
    }
    
    @IBAction func directionButtonPressed(_ sender: UIButton) {
        guard let direction = sender.currentTitle else {
            return
        }
        
        flipView.subviews.forEach { (subView) in
            if let view = subView as? FlipViewType {
                view.directionWasPressed(with: direction)
            }
            //			if subView is FlipViewType {
            //				(subView as! FlipViewType).directionWasPressed(with: direction)
            //			}
        }
    }
    
    @IBAction func flipViewPressed(_ sender: UIButton) {
        UIView.transition(with: flipView, duration: 0.5, options: compassIsShowing ? .transitionFlipFromRight : .transitionFlipFromLeft, animations: {
            self.compassView.isHidden = self.compassIsShowing
            self.degreesView.isHidden = !self.compassIsShowing
            self.compassIsShowing = !self.compassIsShowing
        }, completion: nil)
    }
    
}

