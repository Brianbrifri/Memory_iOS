
import UIKit

class CardView10: UIView, FrontViewApplication {

    let layer10 = CardLayer10()
    var isApplied: Bool = false
    
    override func draw(_ rect: CGRect) {
        layer10.frame = rect
        layer.addSublayer(layer10)
        layer10.needsDisplay()
    }
    
    func apply() {
        isApplied = true
    }
}
