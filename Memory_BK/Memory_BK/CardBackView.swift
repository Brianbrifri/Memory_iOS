
import UIKit

class CardBackView: UIView {

    let backLayer = CardBackLayer()
    var label = UILabel()

    override func draw(_ rect: CGRect) {
        label.text = "slkdjaoidjPOISjdopaijd"
        backLayer.backgroundColor = UIColor.red.cgColor
        backLayer.frame = rect
        layer.addSublayer(backLayer)
        backLayer.needsDisplay()

    }
}
