
import UIKit

class GameControllerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var CardView: Card!
    var isFaceUp = false
    
    private let BACKTAG = 100
    private let FRONTTAG = 200
    
    var cardBackView = UIView()
    var cardFrontView = UIView()
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        print("nibbyness")
////        cardBackView = CardBackView(frame: frame)
////        cardFrontView = CardFrontView(frame: frame)
////        
////        cardBackView.tag = BACKTAG
////        cardFrontView.tag = FRONTTAG
////        
////        CardView.addSubview(cardFrontView)
////        CardView.addSubview(cardBackView)
////        
////        cardFrontView.isHidden = true
//    }
    
    func flip() {
        UIView.transition(with: CardView, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            self.cardFrontView.isHidden = self.isFaceUp
            self.cardBackView.isHidden = !self.isFaceUp
            self.isFaceUp = !self.isFaceUp
            }, completion: nil)
    }
}
