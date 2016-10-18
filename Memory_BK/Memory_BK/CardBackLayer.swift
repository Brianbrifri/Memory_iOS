
import UIKit

//MARK: Default Back Layer
//For all cards
class CardBackLayer: CALayer {
    override func draw(in ctx: CGContext) {
        UIGraphicsPushContext(ctx)
        
        //MARK: The Gradient
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [UIColor.darkGray.cgColor, UIColor.green.cgColor]
        gradient.locations = [0, 1]
        addSublayer(gradient)
        
        UIGraphicsPopContext()
    }
}
