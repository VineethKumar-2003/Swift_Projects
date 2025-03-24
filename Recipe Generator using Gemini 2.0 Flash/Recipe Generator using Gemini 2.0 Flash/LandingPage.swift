//
//  LandingPage.swift
//  Recipe Generator using Gemini 2.0 Flash
//
//  Created by Vineeth Kumar on 22/03/25.
//

import SwiftUI

struct LandingPage: View {
    @State private var preferredCuisine: String = ""
    @State private var levelOfDifficulty: String = "Easy"
    @State private var preparationTime: String = ""
    @State private var mealType: String = "Breakfast"
    @State private var dietaryPreference: String = "Mixed"
    @State private var isButtonPressed = false
    @State private var navigateToLoadingPage = false
    
    let categories = ["Mixed", "Veg", "Non-Veg"]
    let difficultyLevels = ["Easy", "Medium", "Hard"]
    let mealTypes = ["Breakfast", "Lunch", "Dinner", "Snack"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                let topColor = Color(red: 61/255, green: 40/255, blue: 106/255)
                let bottomColor = Color(red: 38/255, green: 32/255, blue: 49/255)
                
                LinearGradient(
                    gradient: Gradient(colors: [topColor, bottomColor]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    Text("Recipe Remixer")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        CustomTextField(title: "Preferred Cuisine", text: $preferredCuisine, placeholder: "Enter your favorite cuisine...")
                        CustomPicker(title: "Level of Difficulty", selection: $levelOfDifficulty, options: difficultyLevels)
                        CustomTextField(title: "Preparation Time", text: $preparationTime, placeholder: "e.g., 10 - 20 minutes")
                        CustomPicker(title: "Meal Type", selection: $mealType, options: mealTypes)
                        
                        // Segmented Control
                        Text("Select Category")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Picker("Category", selection: $dietaryPreference) {
                            ForEach(categories, id: \.self) { category in
                                Text(category)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    .padding(.horizontal, 10)
                    
                    NavigationLink(
                                            destination: LoadingPage(
                                                preferredCuisine: preferredCuisine,
                                                levelOfDifficulty: levelOfDifficulty,
                                                preparationTime: preparationTime,
                                                mealType: mealType,
                                                dietaryPreference: dietaryPreference
                                            ),
                                            isActive: $navigateToLoadingPage
                                        ) {
                                            Button {
                                                isButtonPressed = true
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                                    isButtonPressed = false
                                                    navigateToLoadingPage = true
                                                }
                                            } label: {
                                                Text("Let Him Cook")
                                                    .font(.headline)
                                                    .foregroundStyle(.white)
                                                    .padding()
                                                    .frame(maxWidth: .infinity)
                                                    .background(
                                                        RoundedRectangle(cornerRadius: 12)
                                                            .fill(Color.orange)
                                                            .shadow(color: Color.orange.opacity(0.4), radius: 10, x: 0, y: 5)
                                                    )
                                                    .scaleEffect(isButtonPressed ? 0.95 : 1.0)
                                                    .animation(.easeInOut(duration: 0.1), value: isButtonPressed)
                                            }
                                            .padding(.horizontal, 20)
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding()
                                }
        }
    }
    
    struct CustomTextField: View {
        var title: String
        @Binding var text: String
        var placeholder: String
        
        var body: some View {
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.leading, 5)
                
                ZStack(alignment: .leading) {
                    if text.isEmpty {
                        Text(placeholder)
                            .foregroundStyle(.gray)
                            .padding(.leading, 12)
                    }
                    
                    TextField("", text: $text)
                        .foregroundStyle(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                }
                .padding(5)
            }
        }
    }
    
    struct CustomPicker: View {
        var title: String
        @Binding var selection: String
        var options: [String]
        
        var body: some View {
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.leading, 5)
                
                Menu {
                    ForEach(options, id: \.self) { option in
                        Button(action: { selection = option }) {
                            Text(option)
                        }
                    }
                } label: {
                    HStack {
                        Text(selection)
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                }
            }
        }
    }
}

#Preview {
    LandingPage()
}
