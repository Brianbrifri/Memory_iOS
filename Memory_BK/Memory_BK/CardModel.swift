

import Foundation
import UIKit

protocol CardModelDelegate: class {
//    func setGameMode(with mode: Int)
//    func flipCardsBack(card1: Card, card2: Card)
}

class CardModel {
    
    weak var delegate: CardModelDelegate?

    
    //MARK: Model init
    //with the size the user chooses
    init(delegate: CardModelDelegate, mode: Int, timer: Bool) {
        self.delegate = delegate
//        self.delegate?.setGameMode(with: mode)
    }



}

