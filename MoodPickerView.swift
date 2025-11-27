import SwiftUI
import SwiftData

struct MoodPickerView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    let date: Date
    @State private var mood: MoodType = .happy

    var body: some View {
        VStack(spacing: 20) {
            Text("How do you feel today?")
                .font(.title3.bold())

            HStack(spacing: 14) {
                ForEach(MoodType.allCases, id: \.self) { m in
                    VStack {
                        Text(m.emoji)
                            .font(.system(size: 32))
                            .padding(8)
                            .background(m == mood ? Color.gray.opacity(0.2) : .clear)
                            .clipShape(Circle())
                            .onTapGesture { mood = m }

                        Text(m.displayName)
                            .font(.caption)
                    }
                }
            }

            Button("Save Mood") {
                save()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)

            Spacer()
        }
        .padding()
    }

    private func save() {
        if let existing = try? context.fetch(
            FetchDescriptor<MoodEntry>(
                predicate: #Predicate { $0.date == date }
            )
        ).first {
            existing.mood = mood
            existing.colorHex = mood.colorHex
        } else {
            context.insert(MoodEntry(date: date, mood: mood))
        }

        try? context.save()
        dismiss()
    }
}
