//
//  Concentration.swift
//  Concetration
//
//  Created by user151112 on 2.3.19..
//  Copyright © 2019. user151112. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    var indexOfOneFaceUpCard: Int?
    
    init(nuberOfPairsOfCards: Int){
        for _ in 0..<nuberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
       
        // TODO: shuffle the cards
        for _ in 0..<cards.count * 2 {
            let removed = cards.remove(at: Int(arc4random_uniform(UInt32(cards.count))))
            cards.append(removed)
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatch {
            if let matchIndex = indexOfOneFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatch = true
                    cards[index].isMatch = true
                }
                cards[index].isFaceUp = true
                indexOfOneFaceUpCard = nil
            }
            else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneFaceUpCard = index
            }
        }
    }
}
