//
//  RecommendedRecipesPage.swift
//  Recipe Generator using Gemini 2.0 Flash
//
//  Created by Vineeth Kumar on 22/03/25.
//

import SwiftUI

struct RecommendedRecipesPage: View {
    @State private var recipes: [Recipe] = []
    @State private var errorMessage: String?
    
    let preferredCuisine: String
    let levelOfDifficulty: String
    let preparationTime: String
    let mealType: String
    let dietaryPreference: String
    
    var body: some View {
        ZStack {
            let topColor = Color(red: 61/255, green: 40/255, blue: 106/255)
            let bottomColor = Color(red: 38/255, green: 32/255, blue: 49/255)
            
            LinearGradient (
                gradient: Gradient(colors: [topColor, bottomColor]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                Text("Recommended Recipes")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                    .padding(.top, 20)
                
                if recipes.isEmpty {
                    Text("No Recipes Found")
                        .foregroundStyle(.white)
                        .font(.title2)
                        .padding()
                } else {
                    
                    ScrollView {
                        VStack(spacing: 15) {
                            ForEach(recipes.indices, id: \.self) { index in
                                RecipeCard(recipe: recipes[index], index: index + 1)
                            }
                        }
                        .padding()
                    }
                }
            }
        }
    }
    
    func fetchRecipes() {
        APIManager.shared.fetchRecipes(
            preferredCuisine: preferredCuisine,
            levelOfDifficulty: levelOfDifficulty,
            preparationTime: preparationTime,
            mealType: mealType,
            dietaryPreference: dietaryPreference
        ) { result in
            switch result {
            case .success(let fetchedRecipes):
                self.recipes = fetchedRecipes
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}

struct RecipeCard: View {
    var recipe: Recipe
    var index: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Recipe \(index)")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Text("Yields: \(recipe.yield)")
                .foregroundStyle(.white)
                .font(.body)
            
            Text("Prep Time: \(recipe.preparationTime)")
                .foregroundStyle(.white)
                .font(.body)
            
            Text("Cook Time: \(recipe.cookTime)")
                .foregroundStyle(.white)
                .font(.body)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.black.opacity(0.3))
                .shadow(radius: 5)
        )
    }
}
