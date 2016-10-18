
import UIKit

class CardView6: UIView, FrontViewApplication {

    let layer6 = CardLayer6()
    var isApplied: Bool = false
    
    override func draw(_ rect: CGRect) {
        layer6.frame = rect
        layer.addSublayer(layer6)
        layer6.needsDisplay()
    }
    
    func apply() {
        isApplied = true
    }
}
