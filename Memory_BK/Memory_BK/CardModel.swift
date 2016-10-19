

import Foundation
import UIKit

protocol CardModelDelegate: class {
    //None yet
}



class CardModel {
    
    weak var delegate: CardModelDelegate?
    
    var ListOfLayers: [CALayer]
    var cardCollection: [Card]
    
    var cardLayer1:  CALayer = CardLayer1()
    var cardLayer2:  CALayer = CardLayer2()
    var cardLayer3:  CALayer = CardLayer3()
    var cardLayer4:  CALayer = CardLayer4()
    var cardLayer5:  CALayer = CardLayer5()
    var cardLayer6:  CALayer = CardLayer6()
    var cardLayer7:  CALayer = CardLayer7()
    var cardLayer8:  CALayer = CardLayer8()
    var cardLayer9:  CALayer = CardLayer9()
    var cardLayer10: CALayer = CardLayer10()
    var cardLayer11: CALayer = CardLayer11()
    var cardLayer12: CALayer = CardLayer12()
    var cardLayer13: CALayer = CardLayer13()
    var cardLayer14: CALayer = CardLayer14()
    var cardLayer15: CALayer = CardLayer15()
    var cardLayer16: CALayer = CardLayer16()
    var cardLayer17: CALayer = CardLayer17()
    var cardLayer18: CALayer = CardLayer18()
    
    private var useTimer: Bool
    
    //MARK: Model init
    //with the size the user chooses
    init(delegate: CardModelDelegate, mode: Int, timer: Bool) {
        self.delegate = delegate
        useTimer = timer
        
        //Initialize array of layers
        ListOfLayers = [
            cardLayer1, cardLayer2, cardLayer3, cardLayer4, cardLayer5, cardLayer6, cardLayer7, cardLayer8, cardLayer9,
            cardLayer10, cardLayer11, cardLayer12, cardLayer13, cardLayer14, cardLayer15, cardLayer16, cardLayer17, cardLayer18
        ]
        
        //Initialize array of cards
        cardCollection = initializeCards(grid: mode, layerList: ListOfLayers)
    }
}


//MARK: Card and CardList initilizer function
private func initializeCards(grid: Int, layerList: [CALayer]) -> [Card] {
    print("Got \(grid) in initializeCards")
    
    var cardList: [Card] = []
    var chosen: [Int] = []
    var randomIndex: UInt32
    var index: Int
    
    //MARK: Create all the Cards
    for i in 1...grid {
        let cardBackView = CardBackView()
        var frontLayer: CALayer
        
        repeat {
            randomIndex = arc4random_uniform(18)
            index = Int(randomIndex)
            frontLayer = layerList[index]
        } while(chosen.contains(index))
        
        chosen.append(index)
        
        //MARK: Create the front of the card with the chosen layer
        let cardFrontView = CardFrontView(frame: CGRect.zero, layer: frontLayer)
        let card = Card()
        let matchingCard = Card()
        
        //MARK: Set ID and add subview and add to cardList
        card.setID(ID: i)
        card.addSubview(cardBackView)
        card.addSubview(cardFrontView)
        randomIndex = arc4random_uniform(UInt32(cardList.count))
        index = Int(randomIndex)
        cardList.insert(card, at: index)
        
        //MARK: Duplicate the card and add to cardList
        matchingCard.setID(ID: i)
        matchingCard.addSubview(cardBackView)
        matchingCard.addSubview(cardFrontView)
        randomIndex = arc4random_uniform(UInt32(cardList.count))
        index = Int(randomIndex)
        cardList.insert(matchingCard, at: index)
        print("Matching Cards Added")
    }
    
    
    return cardList
    
}


