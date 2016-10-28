

import Foundation
import UIKit

protocol CardModelDelegate: class {
    func setGameMode(with mode: Int)
    func flipCardsBack(card1: GameControllerCollectionViewCell, card2: GameControllerCollectionViewCell)
}

class CardModel {
    
    weak var delegate: CardModelDelegate?
    var cardCollection: [Card] = []
    private let TOTAL_LAYERS: UInt32 = 18
    private let BACKTAG = 100
    private let FRONTTAG = 200
    private var useTimer: Bool
    private var cardToBeMatched: Card!
    private var needsMatching = false
    private var remainingCards = 36
    
    //MARK: Model init
    //with the size the user chooses
    init(delegate: CardModelDelegate, mode: Int, timer: Bool) {
        self.delegate = delegate
        useTimer = timer

        //Initialize array of cards
        cardCollection = initializeCards(grid: mode)
        remainingCards = cardCollection.count
        self.delegate?.setGameMode(with: mode)
    }

//    //MARK: Check game state after card flip
//    func updateGameState(with index: Int) {
//        if needsMatching {
//            needsMatching = false
//            if cardToBeMatched.getID() == cardCollection[index].getID() {
//                remainingCards -= 2
//                print("MATCH!!!")
//            }
//            else {
//                delegate?.flipCardsBack(card1: cardToBeMatched, card2: cardCollection[index])
//                print("Bad choice brah :(")
//            }
//        }
//        else {
//            cardToBeMatched = cardCollection[index]
//            needsMatching = true
//        }
//    }
    
    //MARK: Card and CardList initilizer function
    private func initializeCards(grid: Int) -> [Card] {
        var cardList: [Card] = []
        var chosen: [Int] = []
        var index: Int
        
        //MARK: Create all the Cards
        for i in 1...grid {
            
            //MARK: While loop to choose random layer types
            repeat {
                index = Int(arc4random_uniform(TOTAL_LAYERS))
            } while(chosen.contains(index))
            
            print("Layer \(index + 1) chosen")
            
            chosen.append(index)
            
            //MARK: Set ID and add subview and add to cardList
            let card = Card()
            card.setID(ID: i)
            index = Int(arc4random_uniform(UInt32(cardList.count)))
            cardList.insert(card, at: index)
            print("Card added at index \(index)")

            //MARK: Duplicate the card and add to cardList
            let matchingCard = Card()
            matchingCard.setID(ID: i)
            index = Int(arc4random_uniform(UInt32(cardList.count)))
            cardList.insert(matchingCard, at: index)
            print("Matching Card added at index \(index)")
        }

        return cardList
    }
}

