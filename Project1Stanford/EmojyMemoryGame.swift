//
//  EmojyMemoryGame.swift
//  Project1Stanford
//
//  Created by user159106 on 9/1/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import SwiftUI

class EmojyMemoryGame: ObservableObject {
   @Published private var model: MemoryGame<String> = EmojyMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃", "🕸"].shuffled()
        let range = Range(2...emojis.count).randomElement()!
        return MemoryGame<String>(numberOfPairsOfCards: range) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    
    
    var font : Font {
        if model.cards.count > 4 {
            return Font.subheadline
        } else {
            return Font.largeTitle
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
