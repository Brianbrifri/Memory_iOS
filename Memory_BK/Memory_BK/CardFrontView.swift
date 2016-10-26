
import UIKit

class CardFrontView: UIView {

    let frontLayer: CALayer
  
    init(frame: CGRect, layer: CALayer) {
        frontLayer = layer
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        frontLayer.frame = rect
        frontLayer.backgroundColor = UIColor.green.cgColor
        layer.addSublayer(frontLayer)
        frontLayer.needsDisplay()
    }
}

