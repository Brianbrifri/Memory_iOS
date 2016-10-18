

import Foundation

protocol CardModelDelegate: class {
    //None yet
}

class CardModel {
    
    weak var delegate: CardModelDelegate?
    
    private var cardCollection: [Card]
    private var useTimer: Bool
    
    //MARK: Model init
    //with the size the user chooses
    init(delegate: CardModelDelegate, mode: Int, timer: Bool) {
        self.delegate = delegate
        useTimer = timer
        cardCollection = initializeCards(grid: mode)
    }
}


//MARK: Card initilizer function
private func initializeCards(grid: Int) -> [Card] {
    let temp: [Card] = []
    return temp
    
}
