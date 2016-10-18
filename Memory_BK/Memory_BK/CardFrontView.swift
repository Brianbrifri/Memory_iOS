
import UIKit

class CardFrontView: UIView {

    
    let frontLayer: CALayer
    var isApplied: Bool = false

//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
    
    init(frame: CGRect, layer: CALayer) {
        frontLayer = layer
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        frontLayer.frame = rect
        layer.addSublayer(frontLayer)
        frontLayer.needsDisplay()
    }
    
    func apply() {
        isApplied = true
    }
}
