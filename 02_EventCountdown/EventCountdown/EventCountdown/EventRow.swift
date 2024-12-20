import SwiftUI

struct EventRow: View {
    let event: Event
    private let dateFormatter = RelativeDateTimeFormatter()
    
    var body: some View {
        HStack() {
            Text(event.title)
                .font(.headline)
                .foregroundColor(event.color)
                .frame(alignment: .leading)
            
            Text(dateFormatter.localizedString(for: event.date, relativeTo: Date()))
                .font(.subheadline)
                .foregroundColor(.secondary)
                .frame(alignment: .trailing)
        }
    }
}

#Preview {
    EventRow(event: Event(id: UUID(), title: "Event Title", date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!, color: .red))
}
