//
//  Card.swift
//  Memory_BK
//
//  Created by vm mac on 10/26/16.
//
//

import UIKit

class Card: UIView {

    override func layoutSubviews() {
        backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        super.layoutSubviews()
    }
    
    override func addSubview(_ view: UIView) {
        super.addSubview(view)
        setupView(with: view)
    }
    
    private func setupView(with view: UIView) {
        subviews.forEach { (subView) in
            subView.translatesAutoresizingMaskIntoConstraints = false
            subView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            subView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            subView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            subView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        }
    }

}
