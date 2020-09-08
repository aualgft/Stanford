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
    @State private var isActive = false
    var body: some View {
        NavigationView {
                List(Theme.allCases) { theme in
                    Button("Present") {
                        self.isActive = self.isActive ? false : true
                    }
                        NavigationLink(destination: EmojiMemoryGameView(viewModel: EmojyMemoryGame(theme: theme))) {
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
