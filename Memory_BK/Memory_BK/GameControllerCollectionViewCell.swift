//
//  GameControllerCollectionViewCell.swift
//  Memory_BK
//
//  Created by vm mac on 10/26/16.
//
//

import UIKit

class GameControllerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellCardView: UIView!
    
    var frontView: FrontView!
    var backView: BackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellCardView.backgroundColor = UIColor.green
        frontView = FrontView(frame: frame)
        backView = BackView(frame: frame)
        
        cellCardView.addSubview(frontView)
        cellCardView.addSubview(backView)
        frontView.backgroundColor = UIColor.red
        backView.backgroundColor = UIColor.darkGray
    }
    
}
