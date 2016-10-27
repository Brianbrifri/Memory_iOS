//
//  GameControllerCollectionViewCell.swift
//  Memory_BK
//
//  Created by vm mac on 10/26/16.
//
//

import UIKit

var isShowing = true

class GameControllerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellCardView: UIView!
    
    var frontView: FrontView!
    var backView: BackView!
    var isFaceUp = false
    
    override func awakeFromNib() {
        print("awake from nib")
        super.awakeFromNib()
        cellCardView.backgroundColor = UIColor.green
        frontView = FrontView(frame: frame)
        backView = BackView(frame: frame)
        
        cellCardView.addSubview(frontView)
        cellCardView.addSubview(backView)
        frontView.backgroundColor = UIColor.red
        backView.backgroundColor = UIColor.darkGray
        
//        frontView.isHidden = false
//        backView.isHidden = true
    }
    
    func flip() {
        UIView.transition(with: cellCardView, duration: 0.5, options: isFaceUp ? .transitionFlipFromLeft : .transitionFlipFromRight, animations: {
            self.frontView.isHidden = self.isFaceUp
            self.backView.isHidden = !self.isFaceUp
            self.isFaceUp = !self.isFaceUp
            print("front view: \(self.frontView.isHidden)")
            print("back view: \(self.backView.isHidden)")
            print("isFaceUp: \(self.isFaceUp)")
            }, completion: nil)
    }
    
    func flipper() {
        UIView.transition(with: cellCardView, duration: 0.5, options: isFaceUp ? .transitionFlipFromLeft : .transitionFlipFromRight, animations: { 
            self.frontView.isHidden = false
            self.backView.isHidden = true
            self.isFaceUp = true
            }) { (true) in
                print("front view: \(self.frontView.isHidden)")
                print("back view: \(self.backView.isHidden)")
                print("isFaceUp: \(self.isFaceUp)")
        }
    }
    
}
