
import UIKit

class CardView4: UIView, FrontViewApplication {

    let layer4 = CardLayer4()
    var isApplied: Bool = false
    
    override func draw(_ rect: CGRect) {
        layer4.frame = rect
        layer.addSublayer(layer4)
        layer4.needsDisplay()
    }

    func apply() {
        isApplied = true
    }
}
