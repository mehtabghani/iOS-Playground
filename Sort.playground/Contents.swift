import UIKit

let names = ["Taylor", "Timothy", "Tyler", "Thomas", "Tobias", "Tabitha"]

let sortedNames = names.sorted {
    print("Comapring \($0) -  \($1)")
    if $0 < $1 {
        return true
    }
    
    return false
}
print(sortedNames)
names.min()
names.max()
