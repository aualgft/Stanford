//
//  MemoryGameTheViewModel.swift
//  Project1Stanford
//
//  Created by user159106 on 9/4/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import SwiftUI

class MemoryGameThemeViewModel {
    private var model = MemoryGameThemeDataSource()
    var numberOfThemes = Theme.allCases.count
    
    func getTheme(theme: Theme) -> [String]{
        switch theme {
        case .summer:
            return model.summer
        case .winter:
            return model.winter
        case .pets:
            return model.pets
        case .party:
            return model.party
        }
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
