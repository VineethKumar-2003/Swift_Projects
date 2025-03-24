//
//  APIManager.swift
//  Recipe Generator using Gemini 2.0 Flash
//
//  Created by Vineeth Kumar on 23/03/25.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    private let baseURL = "https://recipe-remixer-backend-production.vineeter146.workers.dev/api/recipe"
    
    func fetchRecipes(preferredCuisine: String, levelOfDifficulty: String, preparationTime: String, mealType: String, dietaryPreference: String, completion: @escaping (Result<[Recipe], Error>) -> Void) {
        
        let requestBody = RecipeRequest(
            preferredCuisine: preferredCuisine,
            levelOfDifficulty: levelOfDifficulty,
            preparationTime: preparationTime,
            mealType: mealType,
            dietaryPreference: dietaryPreference
        )

        guard let url = URL(string: baseURL) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONEncoder().encode(requestBody)
        } catch {
            completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 500, userInfo: nil)))
                return
            }
            
            do {
                let decodedRecipes = try JSONDecoder().decode([Recipe].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedRecipes))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
