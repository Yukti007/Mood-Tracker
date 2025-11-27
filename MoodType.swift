import Foundation

enum MoodType: String, CaseIterable, Codable {
    case happy
    case excited
    case soSo
    case sad
    case depressed
    case angry

    var emoji: String {
        switch self {
        case .happy: return "😊"
        case .excited: return "😄"
        case .soSo: return "😐"
        case .sad: return "😔"
        case .depressed: return "😞"
        case .angry: return "😡"
        }
    }

    var colorHex: String {
        switch self {
        case .happy: return "#FFB3C6"
        case .excited: return "#FFD97D"
        case .soSo: return "#A8D5BA"
        case .sad: return "#C3B9FF"
        case .depressed: return "#C4A484"
        case .angry: return "#FF8A8A"
        }
    }

    var displayName: String {
        switch self {
        case .happy: return "Happy"
        case .excited: return "Excited"
        case .soSo: return "So So"
        case .sad: return "Sad"
        case .depressed: return "Depressed"
        case .angry: return "Angry"
        }
    }
}
