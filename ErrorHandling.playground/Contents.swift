import UIKit

enum ServiceError: Error {
    case idMissing
    case tokenMissing(String)
}

extension ServiceError: CustomStringConvertible {
    var description: String {
        switch self {
        case .idMissing:
            return "Custom Message: id is missing"
        case .tokenMissing(let msg):
            return "Custom Message: \(msg)"
        }
    }
}

extension ServiceError: LocalizedError {

    var errorDescription: String? {
        switch self {
        case .idMissing:
            return NSLocalizedString("Localized: id is missing", comment: "")
        case .tokenMissing(let msg):
            return NSLocalizedString("Localized: \(msg)", comment: "")
        }
    }
}

func throwError1() throws {
    throw ServiceError.idMissing
}

func throwError2() throws {
        throw ServiceError.tokenMissing("token needed.")
}



do {
    try throwError1()
} catch ServiceError.idMissing {
    print("Error: id is missing")
}

do {
    try throwError2()
} catch ServiceError.tokenMissing(let msg) {
    print("Error message: \(msg)")
}

do {
    try throwError1()
} catch {
    print("Error: \(error)")
    print("Error: \(error.localizedDescription)")
}

