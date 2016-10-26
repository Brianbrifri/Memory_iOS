
import UIKit

class GameControllerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var CardView: Card!
    
    private let BACKTAG = 100
    private let FRONTTAG = 200
    
    var cardBackView = UIView()
    var cardFrontView = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardBackView = CardBackView(frame: frame)
        cardFrontView = CardFrontView(frame: frame)
        
        cardBackView.tag = BACKTAG
        cardFrontView.tag = FRONTTAG
        
        CardView.addSubview(cardFrontView)
        CardView.addSubview(cardBackView)
    }
}
