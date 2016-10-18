
import UIKit

class CardView14: UIView, FrontViewApplication {

    let layer14 = CardLayer14()
    var isApplied: Bool = false
    
    override func draw(_ rect: CGRect) {
        layer14.frame = rect
        layer.addSublayer(layer14)
        layer14.needsDisplay()
    }
    
    func apply() {
        isApplied = true
    }
}
