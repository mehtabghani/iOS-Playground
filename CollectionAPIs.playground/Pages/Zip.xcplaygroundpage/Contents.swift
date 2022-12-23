//: [Previous](@previous)

import Foundation


/**
 Zip:  we could use the zip method to combine two sequences
 */

var students = ["st1", "st2", "st3", "st4"]
var grades = [90.2, 40.0]
let studentGrades = zip(students, grades)

print(studentGrades)

for pair in studentGrades {
    print("Name: \(pair.0), Grade: \(pair.1)")
}


let brand = ["apple", "samsung", "Xoami"]
let model = ["iPhone 13", "s20", "Mi11"]


for (i,m) in zip(brand, model).enumerated() {
    print(i)
    print(m)
}

