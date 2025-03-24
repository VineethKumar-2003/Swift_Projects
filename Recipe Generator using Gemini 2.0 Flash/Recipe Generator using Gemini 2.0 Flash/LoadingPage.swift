//
//  LoadingPage.swift
//  Recipe Generator using Gemini 2.0 Flash
//
//  Created by Vineeth Kumar on 22/03/25.
//

import SwiftUI

struct LoadingPage: View {
    
    var preferredCuisine: String
    var levelOfDifficulty: String
    var preparationTime: String
    var mealType: String
    var dietaryPreference: String
    
    @State private var isAnimating = false
    @State private var isLoading = true
    @State private var recipes: [Recipe] = []
    @State private var navigateToRecipes = false
    @State private var responseMessage: String = ""
    
    let backendURL = "https://recipe-remixer-backend-production.vineeter146.workers.dev/api/recipe"
    
    var body: some View {
        ZStack {
            let topColor = Color(red: 61/255, green: 40/255, blue: 106/255)
            let bottomColor = Color(red: 38/255, green: 32/255, blue: 49/255)

            LinearGradient(
                gradient: Gradient(colors: [topColor, bottomColor]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                if isLoading {
                    Text("Gemini is Cooking...")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .font(.system(.largeTitle))
                        .padding(5)
                                    
                    Text("'Patience is the Secret ingredient'")
                        .foregroundStyle(.gray)
                        .fontWeight(.medium)
                        .padding(.bottom, 10)
                                    
                    ProgressView()
                        .scaleEffect(1.5)
                        .onAppear {
                            sendDataToBackend()
                        }
                }
            }
        }
    }
    
    func sendDataToBackend() {
        let requestData: [String: Any] = [
            "preferredCuisine": preferredCuisine,
            "levelOfDifficulty": levelOfDifficulty,
            "preparationTime": preparationTime,
            "mealType": mealType,
            "dietaryPreference": dietaryPreference
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: requestData) else {
            DispatchQueue.main.async {
                responseMessage = "❌ Error: Could not encode JSON"
                isLoading = false
            }
            return
        }
        
        guard let url = URL(string: backendURL) else {
            DispatchQueue.main.async {
                responseMessage = "❌ Error: Invalid backend URL"
                isLoading = false
            }
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    responseMessage = "❌ API Error: \(error.localizedDescription)"
                    isLoading = false
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    responseMessage = "❌ Error: No data received"
                    isLoading = false
                }
                return
            }
            
            do {
                let decodedRecipes = try JSONDecoder().decode([Recipe].self, from: data)
                DispatchQueue.main.async {
                    self.recipes = decodedRecipes
                    self.isLoading = false
                    self.navigateToRecipes = true
                }
            } catch {
                DispatchQueue.main.async {
                    responseMessage = "❌ JSON Decoding Error: \(error.localizedDescription)"
                    isLoading = false
                }
            }
        }.resume()
    }
}
