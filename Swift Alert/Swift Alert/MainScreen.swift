//
//  MainScreen.swift
//  Swift Alert
//
//  Created by Vineeth Kumar on 16/02/25.
//

import SwiftUI

struct MainScreen: View {
    @State private var userName: String = "Anonymous Woman"
    @State private var showSettings: Bool = false
    
    var body: some View {
        VStack {
            // Top Section with Greetings and Profile Icon
            HStack {
                VStack(alignment: .leading) {
                    Text("Good Morning,")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("Anonymous Woman")
                        .font(.subheadline)
                }
                .padding(.leading)
                Spacer()
                
                HStack {
                    Button(action: {
                        // Settings Action
                    }) {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.gray)
                    }
                    
                    Button(action: {
                        // Profile Action
                    }) {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundStyle(.pink)
                    }
                }
                .padding(.trailing)
            }
            .padding(.top, 10)
            
            Spacer()
            
            // SOS Button
            Button(action: {
                // SOS Action
            }) {
                ZStack {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 200, height: 200)
                    
                    Image(systemName: "bell.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundStyle(.white)
                }
            }
            
            Text("Your safety starts with one tap")
                .font(.body)
                .padding(.top, 10)
            
            Spacer()
            
            // Bottom Navigation Bar
            HStack {
                Button(action: {
                    // SOS Screen Action
                }) {
                    Text("SOS")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    // Fake Call Action
                }) {
                    Text("Fake Call")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    // Guide Action
                }) {
                    Text("Guide")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .sheet(isPresented: $showSettings) {
            VStack {
                Text("Enter your name")
                    .font(.headline)
                TextField("Your Name", text: $userName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button("Save") {
                    showSettings = false
                }
                .padding()
            }
            .padding()
        }
    }
}

#Preview {
    MainScreen()
}
