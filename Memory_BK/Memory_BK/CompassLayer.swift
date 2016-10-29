//
//  CompassLayer.swift
//  Memory_BK
//
//  Created by vm mac on 10/28/16.
//
//

import UIKit

class CompassLayer: CALayer {
    
    private var arrowLayer = CALayer()
    
    override func draw(in ctx: CGContext) {
        UIGraphicsPushContext(ctx)
        
        /// The Gradient
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [UIColor.black.cgColor, UIColor.red.cgColor]
        gradient.locations = [0, 1]
        addSublayer(gradient)
        
        /// Circle
        let circle = CAShapeLayer()
        circle.lineWidth = 2.0
        circle.fillColor = UIColor(red: 0.9, green: 0.95, blue: 0.93, alpha: 0.9).cgColor
        circle.strokeColor = UIColor.gray.cgColor
        let path = CGMutablePath()
        path.addEllipse(in: bounds.insetBy(dx: 3, dy: 3))
        circle.path = path
        circle.bounds = bounds
        circle.position = CGPoint(x: bounds.midX, y: bounds.midY)
        addSublayer(circle)
        
        /// Cardinal points (in the right order....)
        let points = ["N", "E", "S", "W"]
        for index in 0..<points.count {
            let textLayer = CATextLayer()
            textLayer.string = points[index]
            textLayer.bounds = CGRect(x: 0, y: 0, width: 40, height: 40)
            textLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
            let vertex: CGFloat = circle.bounds.midY / textLayer.bounds.height
            textLayer.anchorPoint = CGPoint(x: 0.5, y: vertex)
            textLayer.alignmentMode = kCAAlignmentCenter
            textLayer.foregroundColor = UIColor.black.cgColor
            textLayer.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat(Double(index) * M_PI / 2.0)))
            circle.addSublayer(textLayer)
        }
        
        /// Arrow
        
        arrowLayer.bounds = bounds
        arrowLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
        arrowLayer.anchorPoint = CGPoint(x: 0.5, y: 0.35)
        arrowLayer.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat(3 * M_PI / 2)))
        arrowLayer.contents = arrowImage()?.cgImage
        
        addSublayer(arrowLayer)
        
        UIGraphicsPopContext()
    }
    
    func arrowImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: frame.width, height: frame.height), false, 1.0)
        
        if let ctx = UIGraphicsGetCurrentContext() {
            ctx.move(to: CGPoint(x: frame.width/2, y: 25))
            ctx.addLine(to: CGPoint(x: frame.width/2, y: frame.height/2))
            ctx.setLineWidth(20)
            ctx.strokePath()
            
            /// Arrowhead
            ctx.setFillColor(UIColor.red.cgColor)
            ctx.move(to: CGPoint(x: frame.width/2 - 20, y: 25))
            ctx.addLine(to: CGPoint(x: frame.width/2, y: 0))
            ctx.addLine(to: CGPoint(x: frame.width/2 + 20, y: 25))
            ctx.fillPath()
            
            ///cutout at the bottom
            ctx.move(to: CGPoint(x: frame.width/2 - 10, y: frame.width/2))
            ctx.addLine(to: CGPoint(x: frame.width/2, y: frame.height/2 - 10))
            ctx.addLine(to: CGPoint(x: frame.width/2 + 10, y: frame.height/2))
            ctx.setBlendMode(CGBlendMode.clear)
            ctx.fillPath()
            
            let arrowImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return arrowImage
        }
        return nil
    }
    
    func rotateArrow(with transform: CGAffineTransform) {
        CATransaction.setAnimationDuration(1.0)
        arrowLayer.setAffineTransform(transform)
    }
}
