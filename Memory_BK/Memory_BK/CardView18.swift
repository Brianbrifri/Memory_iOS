
import UIKit

class CardView18: UIView, FrontViewApplication {

    let layer18 = CardLayer18()
    var isApplied: Bool = false
    
    override func draw(_ rect: CGRect) {
        layer18.frame = rect
        layer.addSublayer(layer18)
        layer18.needsDisplay()
    }
    
    func apply() {
        isApplied = true
    }
}
