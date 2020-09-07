//
//  ContentView.swift
//  Project1Stanford
//
//  Created by user159106 on 8/26/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
   @ObservedObject var viewModel: EmojyMemoryGame
    
    var body: some View {
            Grid(viewModel.cards) {
                card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            .padding(5)
            }
        
        .padding()
        .foregroundColor(Color.orange)
        .aspectRatio(2/3, contentMode: .fit)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geomtry in
        ZStack {
            if self.card.isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text(self.card.content)
                
            } else {
                if !self.card.isMatched {
                RoundedRectangle(cornerRadius: 10).fill()
                }
            }
        }
        .font(Font.system(size: min(geomtry.size.width, geomtry.size.height) * 0.75))
        }
    }
}
