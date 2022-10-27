//
//  MainView.swift
//  Click WatchKit Extension
//
//  Created by Egor Molchanov on 10.08.2022.
//  Copyright © 2022 Egor and the fucked up. All rights reserved.
//

import SwiftUI
import HealthKit

struct MainView: View {
  
  @StateObject var settings = Settings()
  
  @State private var isClicking = false
  @State private var isShowingTempoSettings = false
  @State private var isShowingSignatureSetttings = false
  
  private var workoutWorker = WorkoutWorker()
  
  var body: some View {
    VStack {
      Spacer()
      
      HStack {
        ParameterView(
          title: "Tempo",
          text: "\(settings.tempo)",
          action: handleTempoButtonTap)
        .sheet(isPresented: $isShowingTempoSettings) {
          TempoView()
        }
        
        ParameterView(
          title: "Signature",
          text: "\(settings.beats)/\(settings.note)",
          action: handleSignatureButtonTap)
        .sheet(isPresented: $isShowingSignatureSetttings) {
          SignatureView()
        }
      }.fixedSize(horizontal: false, vertical: true)
      
      Spacer()
      
      Button(isClicking ? "Stop" : "Start", action: handleStartButtonTap)
        .background(.red)
        .cornerRadius(22.0)
        .tint(.red)
        .foregroundColor(.black)
        .font(.system(.body, design: .rounded).bold())
      
      Spacer()
    }
  }
  
  private func handleTempoButtonTap() {
    isShowingTempoSettings.toggle()
  }
  
  private func handleSignatureButtonTap() {
    isShowingSignatureSetttings.toggle()
  }
  
  private func handleStartButtonTap() {
    isClicking.toggle()
    if isClicking {
      workoutWorker.start(settings: settings)
    } else {
      workoutWorker.stop()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
