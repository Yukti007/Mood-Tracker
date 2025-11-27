import SwiftUI
import SwiftData

@main
struct MoodTrackerApp: App {

    var body: some Scene {
        WindowGroup {
            MonthGridView()
        }
        .modelContainer(for: [MoodEntry.self])
    }
}
