//
//  MemoryGameTheViewModel.swift
//  Project1Stanford
//
//  Created by user159106 on 9/4/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import SwiftUI

class MemoryGameThemeViewModel {
    var numberOfThemes = Theme.allCases.count
    
    func getTheme(theme: Theme) -> ThemeModel {
        return ThemeModel(theme: theme)
    }
}

enum Theme: String, CaseIterable, Identifiable {
    var id: String {
        UUID().uuidString
    }
    
    case summer = "Summer"
    case winter = "Winter"
    case pets = "Pets"
    case party =  "Party"
}
