
import UIKit

class CardBackView: UIView {

    let backLayer = CardBackLayer()

    override func draw(_ rect: CGRect) {
        backLayer.frame = rect
        layer.addSublayer(backLayer)
        backLayer.needsDisplay()
    }
}
