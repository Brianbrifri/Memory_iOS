

import Foundation
import UIKit

protocol CardModelDelegate: class {
    func setGameMode(with mode: Int)
    func flipCardsBack()
    func cardsMatched()
}

class CardModel {
    
    weak var delegate: CardModelDelegate?
    var emojiList: [String] = ["😈", "☠️", "👺", "🤖", "👹", "💀", "👽", "👾", "😱", "😾", "🕵🏿", "🎩", "🐀", "🐔", "🎱", "📸", "🏴", "☪"]
    var activeEmoji: [String] = []
    private var useTimer: Bool
    private var cardToBeMatched: String!
    var needsMatching = false
    var wonGame = false
    var mode: Int
    private var remainingCards = 0
    
    //MARK: Model init
    //with the size the user chooses
    init(delegate: CardModelDelegate, mode: Int, timer: Bool) {
        self.mode = mode
        remainingCards = mode + mode
        self.delegate = delegate
        useTimer = timer

        //Initialize array of cards
        initializeCards(grid: mode)
        self.delegate?.setGameMode(with: mode)
    }

    //MARK: Check game state after card flip
    //Takes in a cell and checks its id to the one that is already flipped
    //for some reason, it is always -1 even if I set it explicitly
    func updateGameState(with card: String) {
        if needsMatching {
            needsMatching = false
            if cardToBeMatched == card {
                delegate?.cardsMatched()
                remainingCards -= 2
                print("MATCH!!!")
                if remainingCards == 0 {
                    wonGame = true
                }
            }
            else {
                //They don't match so flip them back
                delegate?.flipCardsBack()
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
    
    func reset() {
        wonGame = false
        remainingCards = mode + mode
        initializeCards(grid: mode)
    }
    
    //MARK: activeEmoji list initializer
    private func initializeCards(grid: Int) {
        var index: Int
        var emojiIndex: Int
        var chosen: [Int] = []
        activeEmoji = []
        
        //MARK: Create all the Cards
        for _ in 1...grid {
            repeat {
                emojiIndex = Int(arc4random_uniform(UInt32(emojiList.count)))
            } while chosen.contains(emojiIndex)
            
            chosen.append(emojiIndex)

            index = Int(arc4random_uniform(UInt32(activeEmoji.count)))
            activeEmoji.insert(emojiList[emojiIndex], at: index)
            print("Card added at index \(index)")

            index = Int(arc4random_uniform(UInt32(activeEmoji.count)))
            activeEmoji.insert(emojiList[emojiIndex], at: index)
            print("Matching Card added at index \(index)")
        }
    }
}

