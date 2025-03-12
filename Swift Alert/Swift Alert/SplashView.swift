//
//  SplashView.swift
//  Swift Alert
//
//  Created by Vineeth Kumar on 12/03/25.
//

import SwiftUI

struct SplashView: View {
    @State private var navigateToAuth = false
    
    var body: some View {
        VStack {
            Spacer()
            Image("SwiftAlertLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundStyle(.red)
            
            Text("Swift Alert")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 10)
            
            Spacer()
            
            Button(action: {
                navigateToAuth = true
            }) {
                Text("Let's Get Started")
                    .font(.headline)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
            }
        }
    }
}

#Preview {
    SplashView()
}
