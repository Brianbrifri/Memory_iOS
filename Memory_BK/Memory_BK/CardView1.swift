
import UIKit

class CardView1: UIView, FrontViewApplication {

    let layer1 = CardLayer1()
    var isApplied: Bool = false
    
    override func draw(_ rect: CGRect) {
        layer1.frame = rect
        layer.addSublayer(layer1)
        layer1.needsDisplay()
    }

    func apply() {
        isApplied = true
    }
}
