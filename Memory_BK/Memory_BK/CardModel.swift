

import Foundation

class CardModel {
    
    private var cardCollection: [Card]
    private var useTimer: Bool
    
    //MARK: Model init
    //with the size the user chooses
    init(mode: Int, timer: Bool) {
        useTimer = timer
        cardCollection = initializeCards(grid: mode)
    }
}


//MARK: Card initilizer function
private func initializeCards(grid: Int) -> [Card] {
    let temp: [Card] = []
    return temp
    
}
