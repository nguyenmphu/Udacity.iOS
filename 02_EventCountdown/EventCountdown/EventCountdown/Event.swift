import Foundation
import SwiftUI


struct Event: Comparable, Identifiable, Hashable {
    var id: UUID
    var title: String
    var date: Date
    var color: Color
    
    static func < (lhs: Event, rhs: Event) -> Bool {
        lhs.date < rhs.date
    }
}
