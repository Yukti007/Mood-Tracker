import Foundation

extension Date {
    func generateMonthDates() -> [Date] {
        let calendar = Calendar.current
        guard
            let range = calendar.range(of: .day, in: .month, for: self),
            let monthStart = calendar.date(
                from: calendar.dateComponents([.year, .month], from: self)
            )
        else { return [] }

        return range.compactMap { day -> Date? in
            calendar.date(byAdding: .day, value: day - 1, to: monthStart)
        }
    }
}

extension DateFormatter {
    static let monthAndYear: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "MMMM yyyy"
        return df
    }()
}
