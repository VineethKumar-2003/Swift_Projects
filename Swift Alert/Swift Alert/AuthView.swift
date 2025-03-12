//
//  AuthView.swift
//  Swift Alert
//
//  Created by Vineeth Kumar on 12/03/25.
//

import SwiftUI
import FirebaseAuth

struct AuthView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var message = ""
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    var body: some View {
        VStack {
            Text("Sign In or Create Account")
                .font(.title)
                .padding()
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.none)
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: signUp) {
                Text("Sign Up")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
            }
            
            Text(message)
                .foregroundStyle(.red)
                .padding()
        }
        .fullScreenCover(isPresented: $isLoggedIn) {
            MainScreen()
        }
    }
    
    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                message = error.localizedDescription
            } else {
                isLoggedIn = true
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                message = error.localizedDescription
            } else {
                isLoggedIn = true
            }
        }
    }
}

#Preview {
    AuthView()
}
