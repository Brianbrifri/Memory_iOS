
import UIKit

class FrontLayer: CALayer {

    init(with layer: Int) {
        super.init()
        
//        switch layer {
//        case 0:
//            //stuff
//            break
//        case 1:
//            break
//        case 2:
//            break
//        case 3:
//            break
//        case 4:
//            break
//        case 5:
//            break
//        case 6:
//            break
//        case 7:
//            break
//        case 8:
//            break
//        case 9:
//            break
//        case 10:
//            break
//        case 11:
//            break
//        case 12:
//            break
//        case 13:
//            break
//        case 14:
//            break
//        case 15:
//            break
//        case 16:
//            break
//        case 17:
//            break
//        case 18:
//            break
//        default: break
//            //more stuff
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
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
