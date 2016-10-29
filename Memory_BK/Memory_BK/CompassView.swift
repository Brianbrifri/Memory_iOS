//
//  CompassView.swift
//  Memory_BK
//
//  Created by vm mac on 10/28/16.
//
//

import UIKit

class CompassView: UIView, FlipViewType {
    
    private(set) var compassLayer: CompassLayer?
    
    override func draw(_ rect: CGRect) {
        if compassLayer == nil {
            compassLayer = CompassLayer()
            layer.addSublayer(compassLayer!)
        }
        compassLayer?.frame = rect
        compassLayer?.setNeedsDisplay()
    }
    
    func directionWasPressed(with direction: String) {
        var transform: CGAffineTransform
        switch direction.uppercased() {
        case "N":
            transform = CGAffineTransform(rotationAngle: CGFloat(4 * M_PI) / 2.0)
        case "E":
            transform = CGAffineTransform(rotationAngle: CGFloat(M_PI) / 2.0)
        case "S":
            transform = CGAffineTransform(rotationAngle: CGFloat(2 * M_PI) / 2.0)
        case "W":
            transform = CGAffineTransform(rotationAngle: CGFloat(3 * M_PI) / 2.0)
        default:
            transform = CGAffineTransform(rotationAngle: CGFloat(4 * M_PI) / 2.0)
        }
        compassLayer?.rotateArrow(with: transform)
    }
}
