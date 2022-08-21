//
//  WorkoutWorker.swift
//  Click WatchKit Extension
//
//  Created by Egor Molchanov on 21.08.2022.
//  Copyright © 2022 Egor and the fucked up. All rights reserved.
//

import SwiftUI
import HealthKit

class WorkoutWorker: NSObject {
  private var timerWorker = TimerWorker()
  private let healthStore = HKHealthStore()
  private var workoutSession: HKWorkoutSession?
  private lazy var workoutConfiguration: HKWorkoutConfiguration = {
    let configuration = HKWorkoutConfiguration()
    configuration.activityType = .other
    configuration.locationType = .indoor
    return configuration
  }()
  
  func start(settings: Settings) {
    let workoutConfiguration = HKWorkoutConfiguration()
    workoutConfiguration.activityType = .other
    
    Task {
      if HKHealthStore.isHealthDataAvailable() {
        do {
          workoutSession = try HKWorkoutSession(
            healthStore: healthStore,
            configuration: workoutConfiguration)
          workoutSession?.delegate = self
          workoutSession?.startActivity(with: Date())
          await MainActor.run {
            timerWorker.start(interval: 60.0 / Double(settings.tempo))
          }
        } catch {
          print(error)
        }
      } else {
        let isOk = await requestAuthorization()
        guard isOk else { return }
      }
    }
  }
  
  func stop() {
    timerWorker.stop()
    workoutSession?.end()
  }
  
  private func requestAuthorization() async -> Bool {
    let typesToShare: Set = [HKQuantityType.workoutType()]
    let typesToRead: Set<HKQuantityType> = []
    do {
      try await healthStore.requestAuthorization(
        toShare: typesToShare,
        read: typesToRead)
      return true
    } catch {
      print(error)
      return false
    }
  }
}

extension WorkoutWorker: HKWorkoutSessionDelegate {
  func workoutSession(
    _ workoutSession: HKWorkoutSession,
    didFailWithError error: Error
  ) {}
  
  func workoutSession(
    _ workoutSession: HKWorkoutSession,
    didGenerate event: HKWorkoutEvent
  ) {}
  
  func workoutSession(
    _ workoutSession: HKWorkoutSession,
    didChangeTo toState: HKWorkoutSessionState,
    from fromState: HKWorkoutSessionState,
    date: Date
  ) {}
}
