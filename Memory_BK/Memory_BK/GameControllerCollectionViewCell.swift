
import UIKit

class GameControllerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var CardView: Card!
    let frontView = CardFrontView(frame: CGRect.zero)
    let backView = CardBackView(frame: CGRect.zero)
    var frontShowing = false
    
    override func awakeFromNib() {
        CardView.addSubview(frontView)
        CardView.addSubview(backView)
        frontView.isHidden = true
        backView.isHidden = false
        print("frontView isHidden: \(frontView.isHidden)")
    }
   
    func flip() {
        UIView.transition(with: CardView, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            self.frontView.isHidden = self.frontShowing
            self.backView.isHidden = !self.frontShowing
            self.frontShowing = !self.frontShowing
            print("emoji: \(self.frontView.emojiLabel.text)")
            print("frontView isHidden: \(self.frontShowing)")
        }, completion: nil)
    }
}
