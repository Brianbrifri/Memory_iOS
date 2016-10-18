
import UIKit

class CardView7: UIView, FrontViewApplication {

    let layer7 = CardLayer7()
    var isApplied: Bool = false
    
    override func draw(_ rect: CGRect) {
        layer7.frame = rect
        layer.addSublayer(layer7)
        layer7.needsDisplay()
    }
    
    func apply() {
        isApplied = true
    }
}
