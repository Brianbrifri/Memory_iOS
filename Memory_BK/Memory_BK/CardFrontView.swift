
import UIKit

class CardFrontView: UIView {

    var frontLabel = UILabel()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(frontLabel)
        frontLabel.translatesAutoresizingMaskIntoConstraints = false
        frontLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        frontLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        frontLabel.textAlignment = .center
        frontLabel.font = UIFont.systemFont(ofSize: 48)
        frontLabel.text = "💩" // default text for noticing if a view didn't load the card data right
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

