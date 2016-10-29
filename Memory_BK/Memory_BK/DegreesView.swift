//
//  DegreesView.swift
//  Memory_BK
//
//  Created by vm mac on 10/28/16.
//
//

import UIKit

class DegreesView: UIView, FlipViewType {
    
    var degreesLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(degreesLabel)
        degreesLabel.translatesAutoresizingMaskIntoConstraints = false
        degreesLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        degreesLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        degreesLabel.textAlignment = .center
        degreesLabel.font = UIFont.systemFont(ofSize: 60)
        degreesLabel.text = "0°"
        
    }
    
    func directionWasPressed(with direction: String) {
        switch direction.uppercased() {
        case "N":
            degreesLabel.text = "0°"
        case "E":
            degreesLabel.text = "90°"
        case "S":
            degreesLabel.text = "180°"
        case "W":
            degreesLabel.text = "270°"
        default:
            degreesLabel.text = "0°"
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

