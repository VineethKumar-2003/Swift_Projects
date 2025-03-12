//
//  FakeCallSetupView.swift
//  Swift Alert
//
//  Created by Vineeth Kumar on 17/02/25.
//

import SwiftUI

struct FakeCallSetupView: View {
    @State private var callerName: String = ""
    @State private var selectedContact: String = "Mom"
    @State private var audioURL: URL?
    @State private var showAudioPicker = false
    @State private var navigateToIncomingCall = false
    
    let contact = ["Mom", "Dad", "Friend", "Brother", "Sister"]
    
    var body: some View {
        VStack {
            Text("Setup Fake Call")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            TextField ("Enter Caller Name", text: $callerName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Picker("Select Contact to Mimic", selection: $selectedContact) {
                ForEach(contact, id: \.self) { contact in
                    Text(contact)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            
            Button(action: {
                showAudioPicker = true
            }) {
                Text(audioURL == nil ? "Choose Audio File" : "Audio Selected")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
            }
            .padding()
            
            Spacer()
            
            Button(action :{
                navigateToIncomingCall = true
            }) {
                Text("Start Fake Call")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding()
        }
        .padding()
        .sheet(isPresented: $showAudioPicker) {
            AudioPicker(selectedAudio: $audioURL)
        }
        .background(
            NavigationLink("", destination: IncomingCallView(callerName: callerName, audioURL: audioURL), isActive: $navigateToIncomingCall)
        )
    }
}

#Preview {
    FakeCallSetupView()
}
