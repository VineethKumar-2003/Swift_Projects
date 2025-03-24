//
//  Recipe.swift
//  Recipe Generator using Gemini 2.0 Flash
//
//  Created by Vineeth Kumar on 23/03/25.
//

import Foundation

struct Recipe: Codable, Identifiable {
    var id: UUID
    let name: String
    let yield: String
    let preparationTime: String
    let cookTime: String
    let ingredients: [String]
    let instructions: [String]
    
    init(name: String, yield: String, preparationTime: String, cookTime: String, ingredients: [String], instructions: [String]) {
        self.id = UUID()
        self.name = name
        self.yield = yield
        self.preparationTime = preparationTime
        self.cookTime = cookTime
        self.ingredients = ingredients
        self.instructions = instructions
    }
}

struct RecipeRequest: Codable {
    let preferredCuisine: String
    let levelOfDifficulty: String
    let preparationTime: String
    let mealType: String
    let dietaryPreference: String
}

