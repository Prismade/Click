//
//  ParameterView.swift
//  Click WatchKit Extension
//
//  Created by Egor Molchanov on 27.10.2022.
//  Copyright © 2022 Egor and the fucked up. All rights reserved.
//

import SwiftUI

struct ParameterView: View {
  @State var title: String = ""
  @State var text: String = ""
  var action: () -> Void
  
  var body: some View {
    Button(action: action) {
      VStack {
        Text(title)
          .foregroundColor(.accentColor)
          .font(.system(size: Constants.titleFontSize))
        Text(text)
          .font(
            .system(
              size: Constants.textFontSize,
              weight: .bold,
              design: .rounded))
      }.frame(maxHeight: .infinity)
    }
  }
}

extension ParameterView {
  enum Constants {
    static let titleFontSize: CGFloat = 11.0
    static let textFontSize: CGFloat = 24.0
  }
}

struct ParameterView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ParameterView(title: "Tempo", text: "120", action: {})
      ParameterView(title: "Signature", text: "4/4", action: {})
    }
    .previewLayout(.fixed(width: 84, height: 70))
  }
}
