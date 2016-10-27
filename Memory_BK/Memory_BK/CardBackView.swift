
import UIKit

class CardBackView: UIView {

    var label = UILabel()

    override func draw(_ rect: CGRect) {
        addSubview(label)
        self.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.red
        label.text = "slkdjaoidjPOISjdopaijd"

    }
}
	
