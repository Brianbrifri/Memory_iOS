

import Foundation
import UIKit

protocol CardModelDelegate: class {
    func setGameMode(with mode: Int)
    func flipCardsBack(card1: Card, card2: Card)
}

class CardModel {
    
    weak var delegate: CardModelDelegate?
    var cardCollection: [Card] = []
    private let TOTAL_LAYERS: UInt32 = 18
    private let BACKTAG = 100
    private let FRONTTAG = 200
    private var useTimer: Bool
    private var cardToBeMatched = Card()
    private var needsMatching = false
    
    //MARK: Model init
    //with the size the user chooses
    init(delegate: CardModelDelegate, mode: Int, timer: Bool) {
        self.delegate = delegate
        useTimer = timer

        //Initialize array of cards
        cardCollection = initializeCards(grid: mode)
        self.delegate?.setGameMode(with: mode)
    }

    //MARK: Check game state after card flip
    func updateGameState(with index: Int) {
        if needsMatching {
            needsMatching = false
            if cardToBeMatched.getID() == cardCollection[index].getID() {
                print("MATCH!!!")
            }
            else {
                delegate?.flipCardsBack(card1: cardToBeMatched, card2: cardCollection[index])
                print("Bad choice brah :(")
            }
        }
        else {
            cardToBeMatched = cardCollection[index]
            needsMatching = true
        }
    }
    
    //MARK: Card and CardList initilizer function
    private func initializeCards(grid: Int) -> [Card] {
        var cardList: [Card] = []
        var chosen: [Int] = []
        var index: Int
        
        //MARK: Create all the Cards
        for i in 1...grid {
            let cardBackView = CardBackView()
            cardBackView.tag = BACKTAG
            
            //MARK: While loop to choose random layer types
            repeat {
                index = Int(arc4random_uniform(TOTAL_LAYERS))
            } while(chosen.contains(index))
            
            //MARK: Create two matching layers to add to two cards
            let frontLayer = FrontLayer.init(with: index)
            let matchingFrontLayer = FrontLayer.init(with: index)
            
            print("Layer \(index + 1) chosen")
            
            chosen.append(index)
            
            //MARK: Set ID and add subview and add to cardList
            let card = Card()
            let cardFrontView = CardFrontView(frame: CGRect.zero, layer: frontLayer)
            cardFrontView.tag = 200
            card.setID(ID: i)
            card.addSubview(cardBackView)
            card.addSubview(cardFrontView)
            index = Int(arc4random_uniform(UInt32(cardList.count)))
            cardList.insert(card, at: index)
            print("Card added at index \(index)")

            //MARK: Duplicate the card and add to cardList
            let matchingCard = Card()
            let matchingCardFrontView = CardFrontView(frame: CGRect.zero, layer: matchingFrontLayer)
            matchingCardFrontView.tag = FRONTTAG
            matchingCard.setID(ID: i)
            matchingCard.addSubview(cardBackView)
            matchingCard.addSubview(matchingCardFrontView)
            index = Int(arc4random_uniform(UInt32(cardList.count)))
            cardList.insert(matchingCard, at: index)
            print("Matching Card added at index \(index)")
        }

        return cardList
    }
}

