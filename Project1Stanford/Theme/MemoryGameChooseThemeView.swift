//
//  MemoryGameChooseThemeView.swift
//  Project1Stanford
//
//  Created by user159106 on 9/4/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import SwiftUI

struct MemoryGameChooseThemeView: View {
    var model = MemoryGameThemeViewModel()
    var body: some View {
        NavigationView {
                List(Theme.allCases) { theme in
                        NavigationLink(destination: EmojiMemoryGameView(viewModel: EmojyMemoryGame())) {
                            Text(theme.rawValue)
                    }
                }
          .navigationBarTitle("Choose a Theme")
        }
        
    }
}


struct ThemeView: View {
    var themeName: String
    var body: some View {
        HStack {
            Text(themeName)
        }
    }
}
