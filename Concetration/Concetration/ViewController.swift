//
//  ViewController.swift
//  Concetration
//
//  Created by user151112 on 28.2.19..
//  Copyright © 2019. user151112. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    var numberOfPairsOfCards: Int {
            return (cardButtons.count+1) / 2
    }
    
    private lazy var game = Concentration(nuberOfPairsOfCards: numberOfPairsOfCards)
    
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips \(flipCount)"
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromMode()
        }
    }
    
    private func updateViewFromMode() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatch ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    private var emojiChoises = ["👻", "🦇", "😈", "🎃", "🍎", "🙀", "😱", "💀"]
    private var emoji = [Int: String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil && emojiChoises.count > 0  {
            emoji[card.identifier] = emojiChoises.remove(at: emojiChoises.count.ac4random)
        }
        return emoji[card.identifier] ?? "?"
    }

}


extension Int {
    var ac4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }
        else {
            return 0
        }
    }
}
