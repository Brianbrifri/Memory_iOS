
import UIKit

class CardView9: UIView, FrontViewApplication {

    let layer9 = CardLayer9()
    var isApplied: Bool = false
    
    override func draw(_ rect: CGRect) {
        layer9.frame = rect
        layer.addSublayer(layer9)
        layer9.needsDisplay()
    }
    
    func apply() {
        isApplied = true
    }
}
