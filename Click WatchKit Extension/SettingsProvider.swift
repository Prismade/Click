//
//  SettingsProvider.swift
//  Click WatchKit Extension
//
//  Created by Egor Molchanov on 10.08.2022.
//  Copyright © 2022 Egor and the fucked up. All rights reserved.
//

import Foundation

class Settings: ObservableObject {
  @Published var tempo: Int {
    didSet {
      UserDefaults.standard.set(tempo, forKey: Keys.tempo)
    }
  }
  
  @Published var beats: Int {
    didSet {
      UserDefaults.standard.set(beats, forKey: Keys.beats)
    }
  }
  
  @Published var note: Int {
    didSet {
      UserDefaults.standard.set(note, forKey: Keys.note)
    }
  }
  
  init() {
    tempo = (UserDefaults.standard.object(forKey: Keys.tempo) as? Int) ?? 120
    beats = (UserDefaults.standard.object(forKey: Keys.beats) as? Int) ?? 4
    note = (UserDefaults.standard.object(forKey: Keys.note) as? Int) ?? 4
  }
}

extension Settings {
  enum Keys {
    static var tempo: String { "Tempo" }
    static var beats: String { "Beats" }
    static var note: String { "Note" }
  }
}
