import UIKit


enum Role: String, Codable {
    case developer
    case tester
    case none
}

struct User: Codable {
    let id: Int
    let name: String
    let role: Role
    let createdAt: Date?
}

// MARK: Decoding

var json = "{ \"id\" : 22, \"name\" : \"Dev user\", \"role\" : \"developer\"}"

if let data = json.data(using: .utf8) {
    let decoder = JSONDecoder()
    let user = try! decoder.decode(User.self, from: data)
    print(user)
}

// MARK: Encoding
let user = User(id: 23, name: "test user", role: .tester, createdAt: Date())

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted
encoder.dateEncodingStrategy = .iso8601
let data = try! encoder.encode(user)
print(String(data: data, encoding: .utf8)!)

