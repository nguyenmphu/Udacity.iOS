import Foundation

struct Emojis {
    static let COMPLETED = "✅"
    static let IN_COMPLETED = "❌"
    static let LISTING = "📝"
    static let ADDING = "📌"
    static let DELETE = "🗑️"
    static let HIGHTLIGHT = "🌟"
    static let ERROR = "❗"
    static let EXIST = "👋"
}

struct Todo : Decodable {
    var id: UUID
    var title: String
    var isCompleted: Bool
    
    init(title: String, isComplete: Bool = false) {
        self.id = UUID()
        self.title = title
        self.isCompleted = isComplete
    }
}

extension Todo: CustomStringConvertible {
    var description: String {
        return "\(isCompleted ? Emojis.COMPLETED : Emojis.IN_COMPLETED) \(title)"
    }
}

protocol Cache {
    func save(todos: [Todo])
    func load() -> [Todo]?
}

final class JSONFileManagerCache: Cache {
    private var filePath: String

    init(path: String? = nil) {
        self.filePath = path ?? "\(NSTemporaryDirectory())todo.json"
    }

    func load() -> [Todo]? {
        do {
            var jsonData = NSData(contentsOfFile: self.filePath)
            return JSONSerialization.jsonObject(with: jsonData)
        } catch {
            return nil
        }

    }    
}

final class InMemoryCache: Cache {
    private var todos: [Todo]

    init() {
        self.todos = []
    }

    func save(todos: [Todo]) {
        self.todos = todos;
    }

    func load() -> [Todo]? {
        return self.todos
    }
}

// The `TodosManager` class should have:
// * A function `func listTodos()` to display all todos.
// * A function named `func addTodo(with title: String)` to insert a new todo.
// * A function named `func toggleCompletion(forTodoAtIndex index: Int)`
//   to alter the completion status of a specific todo using its index.
// * A function named `func deleteTodo(atIndex index: Int)` to remove a todo using its index.
final class TodoManager {

}


// * The `App` class should have a `func run()` method, this method should perpetually
//   await user input and execute commands.
//  * Implement a `Command` enum to specify user commands. Include cases
//    such as `add`, `list`, `toggle`, `delete`, and `exit`.
//  * The enum should be nested inside the definition of the `App` class
final class App {
    
}


// TODO: Write code to set up and run the app.
func main() {
    print(NSTemporaryDirectory())
}

main()