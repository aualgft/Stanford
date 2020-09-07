//
//  Array+only.swift
//  Project1Stanford
//
//  Created by user159106 on 9/3/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import Foundation
extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
