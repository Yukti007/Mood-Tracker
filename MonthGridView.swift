import SwiftUI
import SwiftData

struct MonthGridView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \MoodEntry.date) var entries: [MoodEntry]

    @State private var selectedDate: Date?
    @State private var showPicker = false

    private let days: [Date]

    init() {
        self.days = Date().generateMonthDates()
    }

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 7), spacing: 12) {
                    ForEach(days, id: \.self) { day in
                        let entry = entries.first { Calendar.current.isDate($0.date, inSameDayAs: day) }

                        CatCellView(date: day, entry: entry)
                            .onTapGesture {
                                selectedDate = day
                                showPicker = true
                            }
                    }
                }
                .padding()
            }
            .navigationTitle(DateFormatter.monthAndYear.string(from: Date()))
            .sheet(isPresented: $showPicker) {
                if let d = selectedDate {
                    MoodPickerView(date: d)
                }
            }
        }
    }
}
