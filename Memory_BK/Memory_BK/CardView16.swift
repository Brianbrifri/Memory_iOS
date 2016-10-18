
import UIKit

class CardView16: UIView, FrontViewApplication {

    let layer16 = CardLayer16()
    var isApplied: Bool = false
    
    override func draw(_ rect: CGRect) {
        layer16.frame = rect
        layer.addSublayer(layer16)
        layer16.needsDisplay()
    }
    
    func apply() {
        isApplied = true
    }
}
