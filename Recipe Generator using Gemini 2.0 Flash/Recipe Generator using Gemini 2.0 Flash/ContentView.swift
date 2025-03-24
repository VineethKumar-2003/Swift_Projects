//
//  ContentView.swift
//
//  Recipe Generator using Gemini 2.0 Flash
//
//  Created by Vineeth Kumar on 22/03/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        NavigationStack {
            LandingPage()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
