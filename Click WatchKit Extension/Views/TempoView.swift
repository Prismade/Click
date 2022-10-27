//
//  TempoView.swift
//  Click WatchKit Extension
//
//  Created by Egor Molchanov on 23.08.2022.
//  Copyright © 2022 Egor and the fucked up. All rights reserved.
//

import SwiftUI

struct TempoView: View {
  var body: some View {
    VStack {
      Text("Set tempo")
        .foregroundColor(.accentColor)
      HStack {
        Button(action: handleMinusButtonTap) {
          Image(systemName: "minus")
        }
        .background(.red)
        .foregroundColor(.black)
        .tint(.red)
        .frame(width: 24.0, height: 24.0)
        .cornerRadius(12.0)
        Spacer()
        Text("120").font(.system(size: 42.0, weight: .bold, design: .rounded))
        Spacer()
        Button(action: handlePlusButtonTap) {
          Image(systemName: "plus")
        }
        .background(.red)
        .foregroundColor(.black)
        .tint(.red)
        .frame(width: 24.0, height: 24.0)
        .cornerRadius(12.0)
        
      }
      Text("BPM")
        .font(.system(.body, design: .rounded))
        .foregroundColor(.gray)
    }
    
  }
  
  private func handleMinusButtonTap() {
    
  }
  
  private func handlePlusButtonTap() {
    
  }
}

struct TempoView_Previews: PreviewProvider {
  static var previews: some View {
    TempoView()
  }
}
