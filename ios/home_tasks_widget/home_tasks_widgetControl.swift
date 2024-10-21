////
////  home_tasks_widgetControl.swift
////  home_tasks_widget
////
////  Created by Weronika Sioda on 17/10/2024.
////
//
//import AppIntents
//import SwiftUI
//import WidgetKit
//
//struct home_tasks_widgetControl: ControlWidget {
//    static let kind: String = "com.example.brainTrainApp.home_tasks_widget"
//
//    var body: some ControlWidgetConfiguration {
//        AppIntentControlConfiguration(
//            kind: Self.kind,
//            provider: Provider()
//        ) { value in
//            ControlWidgetToggle(
//                "Start Timer",
//                isOn: value.isRunning,
//                action: StartTimerIntent(value.name)
//            ) { isRunning in
//                Label(isRunning ? "On" : "Off", systemImage: "timer")
//            }
//        }
//        .displayName("Timer")
//        .description("A an example control that runs a timer.")
//    }
//}
//
//extension home_tasks_widgetControl {
//    struct Value {
//        var isRunning: Bool
//        var name: String
//    }
//
//    struct Provider: AppIntentControlValueProvider {
//        func previewValue(configuration: TimerConfiguration) -> Value {
//            home_tasks_widgetControl.Value(isRunning: false, name: configuration.timerName)
//        }
//
//        func currentValue(configuration: TimerConfiguration) async throws -> Value {
//            let isRunning = true // Check if the timer is running
//            return home_tasks_widgetControl.Value(isRunning: isRunning, name: configuration.timerName)
//        }
//    }
//}
//
//struct TimerConfiguration: ControlConfigurationIntent {
//    static let title: LocalizedStringResource = "Timer Name Configuration"
//
//    @Parameter(title: "Timer Name", default: "Timer")
//    var timerName: String
//}
//
//struct StartTimerIntent: SetValueIntent {
//    static let title: LocalizedStringResource = "Start a timer"
//
//    @Parameter(title: "Timer Name")
//    var name: String
//
//    @Parameter(title: "Timer is running")
//    var value: Bool
//
//    init() {}
//
//    init(_ name: String) {
//        self.name = name
//    }
//
//    func perform() async throws -> some IntentResult {
//        // Start the timer…
//        return .result()
//    }
//}
