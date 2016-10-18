
import UIKit

class CardView8: UIView, FrontViewApplication {

    let layer8 = CardLayer8()
    var isApplied: Bool = false
    
    override func draw(_ rect: CGRect) {
        layer8.frame = rect
        layer.addSublayer(layer8)
        layer8.needsDisplay()
    }
    
    func apply() {
        isApplied = true
    }
}
