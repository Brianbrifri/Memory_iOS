
import UIKit

class CardView2: UIView, FrontViewApplication {

    let layer2 = CardLayer2()
    var isApplied: Bool = false
    
    override func draw(_ rect: CGRect) {
        layer2.frame = rect
        layer.addSublayer(layer2)
        layer2.needsDisplay()
    }
    
    func apply() {
        isApplied = true
    }
}
