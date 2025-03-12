//
//  ContentView.swift
//  Swift Alert
//
//  Created by Vineeth Kumar on 16/02/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    var body: some View {
        if isLoggedIn {
            MainScreen()
        } else {
            SplashView()
        }
    }
}
       
#Preview {
    ContentView()
}
