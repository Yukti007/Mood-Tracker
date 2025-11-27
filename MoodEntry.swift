import Foundation
import SwiftData

@Model
final class MoodEntry {
    @Attribute(.unique) var id: UUID
    var date: Date
    var moodRaw: String
    var colorHex: String

    init(date: Date, mood: MoodType) {
        self.id = UUID()
        self.date = date
        self.moodRaw = mood.rawValue
        self.colorHex = mood.colorHex
    }

    var mood: MoodType {
        get { MoodType(rawValue: moodRaw) ?? .soSo }
        set { moodRaw = newValue.rawValue }
    }
}
