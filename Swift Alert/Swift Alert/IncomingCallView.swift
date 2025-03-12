//
//  IncomingCallView.swift
//  Swift Alert
//
//  Created by Vineeth Kumar on 17/02/25.
//

//
//  IncomingCallView.swift
//  Swift Alert
//
//  Created by Vineeth Kumar on 17/02/25.
//

import SwiftUI
import AVFoundation

struct IncomingCallView: View {
    var callerName: String
    var audioURL: URL?
    
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        ZStack {
            // Background blur effect
            LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.8), Color.black.opacity(0.9)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                // Caller name and status
                Text(callerName.isEmpty ? "Unknown" : callerName)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                
                Text("Calling...")
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
                    .padding(.bottom, 50)
                
                Spacer()
                
                // Reminder and Message Options
                HStack(spacing: 150) {
                    VStack {
                        Image(systemName: "alarm.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                        Text("Remind Me")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    
                    VStack {
                        Image(systemName: "message.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                        Text("Message")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                }
                .padding(.bottom, 40)
                
                // Accept and Decline Buttons
                HStack(spacing: 150) {
                    Button(action: {
                        //Decline Action
                    }) {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 70, height: 70)
                            .overlay(Image(systemName: "phone.down.fill"))
                            .font(.system(size:30))
                            .foregroundColor(.white)
                    }
                    
                    Button(action: {
                        playAudio()
                    }) {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 70, height: 70)
                            .overlay(Image(systemName: "phone.fill"))
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    }
                }
                .padding(.bottom, 50)
            }
        }
        .onAppear {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
    }
    
    func playAudio() {
        guard let url = audioURL else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Mom")
        }
    }
}

#Preview {
    IncomingCallView(callerName: "Mom")
}
