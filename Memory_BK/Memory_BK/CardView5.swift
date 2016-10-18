
import UIKit

class CardView5: UIView, FrontViewApplication {

    let layer5 = CardLayer5()
    var isApplied: Bool = false
    
    override func draw(_ rect: CGRect) {
        layer5.frame = rect
        layer.addSublayer(layer5)
        layer5.needsDisplay()
    }
    
    func apply() {
        isApplied = true
    }
}
