import UIKit

@propertyWrapper
struct Uppercased {
    private var value: String

    var wrappedValue: String {
        get { return self.value }
        set { self.value = newValue.uppercased() }
    }

    init(wrappedValue: String) {
        value = wrappedValue.uppercased()
    }
}

struct User {
    @Uppercased var name: String
}

var user = User(name: "mehtab")
print(user.name)
user.name = "ghani"
print(user.name)

