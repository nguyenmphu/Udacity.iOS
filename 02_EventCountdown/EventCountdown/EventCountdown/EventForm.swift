import SwiftUI

enum Mode {
    case add
    case edit(Event)
}

struct EventForm: View {
    @Environment(\.dismiss) var dismiss
    @State private var title: String = ""
    @State private var date: Date = Date()
    @State private var textColor: Color = .black
    
    var mode: Mode
    var onSave: ((Event) -> Void)?
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Untitled", text: $title)
                    .foregroundColor($textColor.wrappedValue)
                    .font(.largeTitle)
                DatePicker("Date", selection: $date)
                    .datePickerStyle(.automatic)
                ColorPicker("Color", selection: $textColor)
            }
            .toolbar {
                if case .add = mode {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let newEvent = Event(id: UUID(), title: title, date: date, color: textColor)
                        onSave?(newEvent)
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                }
            }
            .navigationBarTitle("Add/Edit Event")
            .onAppear {
                if case let .edit(event) = mode {
                    title = event.title
                    date = event.date
                    textColor = event.color
                }
            }
        }
    }
}


#Preview {
    EventForm(mode: .add)
}
