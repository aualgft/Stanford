//
//  MemoryGame.swift
//  Project1Stanford
//
//  Created by user159106 on 9/1/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import Foundation



struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            
            
            cards.indices.filter { index in cards[index].isFaceUp }.only
        }
        
        set {
            for index in cards.indices {
             cards[index].isFaceUp =  index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)" )
        if  let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatch = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatch].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatch].isMatched = true
                    
                }
                self.cards[chosenIndex].isFaceUp = true
            } else {
                
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            
            
        }
    }
    
    init(numberOfPairsOfCards: Int, cardFactoryContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0 ..< numberOfPairsOfCards {
            let content = cardFactoryContent(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
}
