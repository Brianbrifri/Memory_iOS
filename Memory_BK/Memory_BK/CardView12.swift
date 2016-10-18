
import UIKit

class CardView12: UIView, FrontViewApplication {

    let layer12 = CardLayer12()
    var isApplied: Bool = false
    
    override func draw(_ rect: CGRect) {
        layer12.frame = rect
        layer.addSublayer(layer12)
        layer12.needsDisplay()
    }

    func apply() {
        isApplied = true
    }
}
