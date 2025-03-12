//
//  AudioPicker.swift
//  Swift Alert
//
//  Created by Vineeth Kumar on 17/02/25.
//

import SwiftUI

struct AudioPicker: View {
    @Binding var selectedAudio: URL?  // Change to @Binding to bind the selectedAudio

    var body: some View {
        VStack {
            Text("Pick an Audio File")
                .font(.headline)
                .padding()

            Button("Select Sample Audio") {
                selectedAudio = Bundle.main.url(forResource: "sample", withExtension: "mp3")
            }
            .padding()
        }
    }
}
