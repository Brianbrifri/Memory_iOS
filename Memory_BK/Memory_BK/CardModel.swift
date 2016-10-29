

import Foundation
import UIKit

protocol CardModelDelegate: class {
    func setGameMode(with mode: Int)
    func flipCardsBack(card1: Card, card2: Card)
    func cardsMatched(card1: Card, card2: Card)
    func wonGame()
}

class CardModel {
    
    weak var delegate: CardModelDelegate?
    var cardCollection: [Card] = []
    var emojiList: [String] = ["😈", "☠️", "👺", "🤖", "👹", "💀", "👽", "👾", "😱", "😾", "🕵🏿", "🎩", "🐀", "🐔", "🎱", "📸", "🏴", "☪"]
    private let TOTAL_LAYERS: UInt32 = 18
    private let BACKTAG = 100
    private let FRONTTAG = 200
    private var useTimer: Bool
    private var cardToBeMatched: Card!
    private var needsMatching = false
    private var remainingCards = -1
    
    //MARK: Model init
    //with the size the user chooses
    init(delegate: CardModelDelegate, mode: Int, timer: Bool) {
        self.delegate = delegate
        useTimer = timer

        //Initialize array of cards
        cardCollection = initializeCards(grid: mode)
        remainingCards = mode + mode
        self.delegate?.setGameMode(with: mode)
    }

    //MARK: Check game state after card flip
    //Takes in a cell and checks its id to the one that is already flipped
    //for some reason, it is always -1 even if I set it explicitly
    func updateGameState(with card: Card) {
        print("updateGameState called with CardView.ID: \(card.getID())")
        if needsMatching {
            needsMatching = false
            if cardToBeMatched.getID() == card.getID() {
                //Just calling this function here because all the cards are matching
                //due to them all having -1 for the ID for some reason
                delegate?.cardsMatched(card1: cardToBeMatched, card2: card)
//                delegate?.flipCardsBack(card1: cardToBeMatched, card2: card)
                remainingCards -= 2
                print("MATCH!!!")
                if remainingCards == 0 {
                    delegate?.wonGame()
                }
            }
            else {
                //They don't match so flip them back
                delegate?.flipCardsBack(card1: cardToBeMatched, card2: card)
                print("Bad choice brah :(")
            }
        }
        else {
            //There is no card waiting to be matched so
            //set the variable to the one to be matched
            cardToBeMatched = card
            needsMatching = true
        }
    }
    
    //MARK: Card and CardList initilizer function
    //This is probably out of date? I am setting the 
    //cell.CardView to one of these cards and the display works
    //not sure if still need this
    private func initializeCards(grid: Int) -> [Card] {
        var cardList: [Card] = []
        var index: Int
        
        //MARK: Create all the Cards
        for i in 1...grid {
            
            index = Int(arc4random_uniform(UInt32(emojiList.count)))
            let card = Card()
            let matchingCard = Card()
            card.frontView.emojiLabel.text = emojiList[index]
            matchingCard.frontView.emojiLabel.text = emojiList[index]
            emojiList.remove(at: index)

            //MARK: Set ID and add to list
            card.setID(ID: i)
            index = Int(arc4random_uniform(UInt32(cardList.count)))
            cardList.insert(card, at: index)
            print("Card added at index \(index)")

            //MARK: Duplicate the card and add to cardList
            matchingCard.setID(ID: i)
            index = Int(arc4random_uniform(UInt32(cardList.count)))
            cardList.insert(matchingCard, at: index)
            print("Matching Card added at index \(index)")
            
        }

        return cardList
    }
}

