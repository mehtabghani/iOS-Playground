import UIKit

/**
    Reference: https://github.com/raywenderlich/swift-algorithm-club/tree/master/Array2D
*/

public struct Array2D<T> {
  public let columns: Int
  public let rows: Int
  fileprivate var array: [T]
  
  public init(columns: Int, rows: Int, initialValue: T) {
    self.columns = columns
    self.rows = rows
    array = .init(repeating: initialValue, count: rows*columns)
  }
  
  public subscript(column: Int, row: Int) -> T {
    get {
      precondition(column < columns, "Column \(column) Index is out of range. Array<T>(columns: \(columns), rows:\(rows))")
      precondition(row < rows, "Row \(row) Index is out of range. Array<T>(columns: \(columns), rows:\(rows))")
      return array[row*columns + column]
    }
    set {
      precondition(column < columns, "Column \(column) Index is out of range. Array<T>(columns: \(columns), rows:\(rows))")
      precondition(row < rows, "Row \(row) Index is out of range. Array<T>(columns: \(columns), rows:\(rows))")
      array[row*columns + column] = newValue
    }
  }
}

var cookies = Array2D(columns: 2, rows: 2, initialValue: 0)
cookies[0,0] = 0 //0*2+0 -> 0
cookies[0,1] = 1 //0*2+1 -> 1
cookies[1,0] = 2 //1*2+0 -> 2
cookies[1,1] = 3 //1*2+1 -> 3

cookies[0,0]
cookies[0,1]
cookies[1,0]
cookies[0,1]

//cookies[1,1] //throws error


