//
//  Card.swift
//  Concetration
//
//  Created by user151112 on 2.3.19..
//  Copyright © 2019. user151112. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatch = false
    var identifier: Int
    
    static var identifierFactory = 0
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
