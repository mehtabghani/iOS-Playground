import UIKit


enum Compass: Int {
    case north, south, east, west
}


/**
 CaseIterable: provides a collection of all of its values
 */
extension Compass: CaseIterable {
    
}

print(Compass.allCases.map({ "\($0)" }))
print(Compass.allCases.map({ "\($0.rawValue)" }))

/**
 CustomStringConvertible:
 */
extension Compass: CustomStringConvertible {
    public var description: String {
        switch self {
        case .north:
            return "Go to north"
        case .south:
            return "Go to north"
        default:
            return "East or West doesn't matter"
        }
    }
}

let northDesc = String(describing: Compass.north)
let eastDesc = String(describing: Compass.east)
print(northDesc)
print(Compass.north)
print(eastDesc)
print(Compass.east)


/**
 CustomStringConvertible: provide description for debugging purpose
 */
extension Compass: CustomDebugStringConvertible {
    var debugDescription: String {
        return "Debug description of Comapss"
    }
}

debugPrint(Compass.north)


// Mark: Compund Case with associated values

enum Job {
    case developer(exp: Int)
    case designer(exp: Int)
    case pm(exp: Int)
}

let job = Job.developer(exp: 5)

switch job {
case .developer(let exp), .designer(let exp), .pm(let exp):
    print("You have \(exp) year(s) of experience")
}

enum Foo {
    case a(Int)
    case b(Int, Int)
    case c(Int, String, Int)
    case d(String)
}

var test = Foo.c(1, "c", 3)
switch test {
case .a(let i),
     .b(_, let i),
     .c(let i, _, _) where i >= 0:
    
    print(i)
default:
    break
}

// Mark: If/guard case

test = Foo.a(1)

if case .a = test {
    // Action for .a case
}

//guard case .a = test else {
//    //else
//}


