
import UIKit

class GameControllerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var CardView: Card!
    var frontView = CardFrontView(frame: CGRect.zero)
    var backView = CardBackView(frame: CGRect.zero)
    
    override func awakeFromNib() {
        CardView.addSubview(frontView)
        CardView.addSubview(backView)
        frontView.isHidden = true
    }
   
    func flip() {
        UIView.transition(with: CardView, duration: 1, options: .transitionFlipFromLeft, animations: {
            self.frontView.isHidden = self.backView.isHidden
            self.backView.isHidden = !self.backView.isHidden
        }, completion: nil)
    }
}
