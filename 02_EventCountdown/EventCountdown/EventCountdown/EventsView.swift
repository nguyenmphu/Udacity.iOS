import SwiftUI

struct EventsView: View {
    @State private var events: [Event] = []
    @State private var showingAddEvent = false

    var body: some View {
        NavigationStack {
            List(events, id: \.self) { event in
                NavigationLink(value: event) {
                    EventRow(event: event)
                }
            }
            .navigationDestination(for: Event.self) { event in
                EventForm(mode: .edit(event)) { updatedEvent in
                    if let index = events.firstIndex(where: { $0.id == event.id }) {
                        events[index] = updatedEvent
                        events.sort()
                    }
                }
            }
            .navigationTitle("Event Countdown")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddEvent = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddEvent) {
                EventForm(mode: .add) { newEvent in
                    events.append(newEvent)
                    events.sort()
                }
            }
        }
    }
}



#Preview {
    EventsView()
}
