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
        VStack {
            Grid(viewModel.cards) {
                card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration: 1)) {
                    self.viewModel.choose(card: card)
                    }
                }
                .padding(5)
            }
                
            .padding()
            .foregroundColor(Color.orange)
            .aspectRatio(2/3, contentMode: .fit)
            Button(action: {
                withAnimation(.easeInOut) {
                self.viewModel.newGame()
                }
            }, label: { Text("New Game") })
        }
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
                    PieShape(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(120-90),clockwise: true)
                        .padding(5)
                        .opacity(0.4)
                    Text(self.card.content)
                        .rotationEffect(Angle(degrees: self.card.isMatched ? 360 : 0))
                        .animation(self.card.isMatched ?  Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
                        .opacity( self.card.isFaceUp ? 1 : 0)
                } else {
                    if !self.card.isMatched {
                        RoundedRectangle(cornerRadius: 10).fill()
                        .opacity( self.card.isFaceUp ? 0 : 1)
                    }
                }
            }
            .rotation3DEffect(Angle.degrees(self.card.isFaceUp ? 0 : 180 ), axis: (0,1,0))
            .font(Font.system(size: min(geomtry.size.width, geomtry.size.height) * 0.75))
        }
        .transition(AnyTransition.scale)
       
    }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojyMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel:game)
    }
}
