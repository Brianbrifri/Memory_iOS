
import UIKit

class CardView11: UIView, FrontViewApplication {

    let layer11 = CardLayer11()
    var isApplied: Bool = false
    
    override func draw(_ rect: CGRect) {
        layer11.frame = rect
        layer.addSublayer(layer11)
        layer11.needsDisplay()
    }
    
    func apply() {
        isApplied = true
    }
}
