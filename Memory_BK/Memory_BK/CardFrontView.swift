
import UIKit

class CardFrontView: UIView {

    var emojiLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(emojiLabel)
        
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        emojiLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        emojiLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        emojiLabel.textAlignment = .center
        emojiLabel.font = UIFont.systemFont(ofSize: 48)
        emojiLabel.text = "💩" 
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

