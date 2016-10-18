
import UIKit

class CardView13: UIView, FrontViewApplication {

    let layer13 = CardLayer13()
    var isApplied: Bool = false
    
    override func draw(_ rect: CGRect) {
        layer13.frame = rect
        layer.addSublayer(layer13)
        layer13.needsDisplay()
    }

    func apply() {
        isApplied = true
    }
}
