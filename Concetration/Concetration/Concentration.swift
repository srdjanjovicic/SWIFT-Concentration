//
//  Concentration.swift
//  Concetration
//
//  Created by user151112 on 2.3.19..
//  Copyright © 2019. user151112. All rights reserved.
//

import Foundation

class Concentration {
    private(set) var cards = [Card]()
    
    private var indexOfOneFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    }
                    else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    init(nuberOfPairsOfCards: Int){
        assert(nuberOfPairsOfCards > 0, "You must have at least one pair of cards")
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
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatch {
            if let matchIndex = indexOfOneFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatch = true
                    cards[index].isMatch = true
                }
                cards[index].isFaceUp = true
                
            }
            else {
                indexOfOneFaceUpCard = index
            }
        }
    }
}
