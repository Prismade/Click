//
//  TimerWorker.swift
//  Click WatchKit Extension
//
//  Created by Egor Molchanov on 21.08.2022.
//  Copyright © 2022 Egor and the fucked up. All rights reserved.
//

import WatchKit

class TimerWorker {
  var timer: Timer?
  
  func start(interval: Double) {
    stop()
    timer = Timer.scheduledTimer(
      withTimeInterval: interval,
      repeats: true,
      block: { _ in
        WKInterfaceDevice.current().play(.start)
      })
    RunLoop.main.add(timer!, forMode: .default)
  }
  
  func stop() {
    if timer != nil {
      timer?.invalidate()
      timer = nil
    }
  }
}
