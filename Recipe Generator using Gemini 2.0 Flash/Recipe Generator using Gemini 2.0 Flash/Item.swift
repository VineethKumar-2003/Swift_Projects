//
//  Item.swift
//  Recipe Generator using Gemini 2.0 Flash
//
//  Created by Vineeth Kumar on 22/03/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
