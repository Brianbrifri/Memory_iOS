
import UIKit

class CardView3: UIView, FrontViewApplication {

    let layer3 = CardLayer3()
    var isApplied: Bool = false
    
    override func draw(_ rect: CGRect) {
        layer3.frame = rect
        layer.addSublayer(layer3)
        layer3.needsDisplay()
    }
    
    func apply() {
        isApplied = true
    }
}
