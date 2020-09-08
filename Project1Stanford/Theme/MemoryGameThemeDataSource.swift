//
//  MemoryGameThemeDataSource.swift
//  Project1Stanford
//
//  Created by user159106 on 9/4/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import SwiftUI

struct ThemeModel {
    var color: Color
    var themeData: [String]
    var theme: Theme
    
    init(theme: Theme) {
        self.theme = theme
        switch theme {
        case .summer:
            self.themeData =  ["🥵","⛱","🏖","⛱"]
            self.color = .red
        case .winter:
            self.themeData = ["⛄️","🏂","⛷","🥶"]
            self.color = .blue
        case .pets:
            self.themeData = ["🐈","🐀","🐕","🦜"]
            self.color = .green
        case .party:
            self.themeData = ["🥳","🎊","🎁","💃"]
            self.color = .pink
        }
    }
}

