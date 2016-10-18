
import UIKit

class CardView15: UIView, FrontViewApplication {

    let layer15 = CardLayer15()
    var isApplied: Bool = false
    
    override func draw(_ rect: CGRect) {
        layer15.frame = rect
        layer.addSublayer(layer15)
        layer15.needsDisplay()
    }

    func apply() {
        isApplied = true
    }
}
