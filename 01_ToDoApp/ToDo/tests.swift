import XCTest
@testable import Sources

final class AppTests: XCTestCase {
    func todoToString() {
        let completedTodo = Todo(title: "Completed TODO", isComplete: true)
        let inCompletedTdo = Todo(title: "In Completed TODO", isComplete: false)
        XCTAssertEqual(completedTodo.description, "✅ Completed TODO")
        XCTAssertEqual(inCompletedTdo.description, "❌ In Completed TODO")
    }
}
