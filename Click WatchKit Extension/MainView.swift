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
  @State var isClicking = false
  var workoutWorker = WorkoutWorker()
  var body: some View {
    NavigationView {
      VStack {
        Spacer()
        
        HStack {
          Button(action: handleTempoButtonTap) {
            VStack {
              Text("Tempo")
                .foregroundColor(.red)
                .font(.system(size: 11.0))
              Text("\(settings.tempo)")
                .font(.system(size: 24.0, weight: .bold, design: .rounded))
            }.frame(maxHeight: .infinity)
          }
          
          Button(action: handleSignatureButtonTap) {
            VStack {
              Text("Signature")
                .foregroundColor(.red)
                .font(.system(size: 11.0))
              Text("\(settings.beats)/\(settings.note)")
                .font(.system(size: 24.0, weight: .bold, design: .rounded))
            }.frame(maxHeight: .infinity)
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
  }
  
  private func handleTempoButtonTap() {
    
  }
  
  private func handleSignatureButtonTap() {
    
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
