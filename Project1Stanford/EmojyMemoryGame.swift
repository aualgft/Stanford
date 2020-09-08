//
//  EmojyMemoryGame.swift
//  Project1Stanford
//
//  Created by user159106 on 9/1/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import SwiftUI

class EmojyMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>
    var theme: Theme
    var color: Color
    var points = 0
    
    init(theme: Theme) {
        self.theme = theme
        let emojis: Array<String> = ThemeModel(theme: theme).themeData.shuffled()
        self.color = ThemeModel(theme: theme).color
        let range = Range(2...emojis.count).randomElement()!
        self.model = MemoryGame<String>(numberOfPairsOfCards: range) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    func newGame() {
        let randomThemeCase = Theme.allCases.randomElement()!
        let randomThemeModel = ThemeModel(theme: randomThemeCase)
        
        self.theme = randomThemeCase
        let emojis: Array<String> = randomThemeModel.themeData.shuffled()
        self.color = randomThemeModel.color
        let range = Range(2...emojis.count).randomElement()!
        self.model = MemoryGame<String>(numberOfPairsOfCards: range) { pairIndex in
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
