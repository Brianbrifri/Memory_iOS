
import UIKit

class GameControllerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var CardView: Card!
    let backView = CardBackView(frame: CGRect.zero)
    let frontView = CardFrontView(frame: CGRect.zero)
    private let BACKTAG = 100
    private let FRONTTAG = 200
    
    override func awakeFromNib() {
        print("got nibbed in the ass")
        super.awakeFromNib()
        backView.tag = BACKTAG
        frontView.tag = FRONTTAG
        CardView.addSubview(backView)
        CardView.addSubview(frontView)
        frontView.isHidden = true
    }
    

    func flip() {
        UIView.transition(with: CardView, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            self.backView.isHidden = self.frontView.isHidden
            self.frontView.isHidden = !self.frontView.isHidden
            print("I tried to flip")
        }, completion: nil)
    }
}
