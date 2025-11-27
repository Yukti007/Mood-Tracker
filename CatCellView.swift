import SwiftUI

struct CatCellView: View {
    let date: Date
    let entry: MoodEntry?

    var body: some View {
        ZStack {
            if let entry = entry {
                Image("cat_filled")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color(hex: entry.colorHex))

                Text(entry.mood.emoji)
                    .font(.system(size: 20))
            } else {
                Image("cat_outline")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.35)
            }
        }
        .frame(height: 55)
        .padding(4)
    }
}
