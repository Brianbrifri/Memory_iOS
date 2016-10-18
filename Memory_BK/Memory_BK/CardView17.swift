
import UIKit

class CardView17: UIView, FrontViewApplication {

    let layer17 = CardLayer17()
    var isApplied: Bool = false
    
    override func draw(_ rect: CGRect) {
        layer17.frame = rect
        layer.addSublayer(layer17)
        layer17.needsDisplay()
    }

    func apply() {
        isApplied = true
    }
}
