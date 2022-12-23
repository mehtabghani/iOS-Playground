import UIKit

//1 - create product protocol: ChairProtocol, TableProtocl
//2 - create concrete product variants: ModrenChair, ModrenTable related to same factory
//3 - create Factory protocol
//4 - create Factory variants: Modren, Victoria


//1 - Products
protocol Chair {
    func getSize() -> CGSize
}

protocol Table {
    func getSize() -> CGSize
}

//2 - Concrete product

//Chair
struct ModrenChair: Chair {
    func getSize() -> CGSize {
        return CGSize.init(width: 100, height: 100)
    }
}

struct VictorianChair: Chair {
    func getSize() -> CGSize {
        return CGSize.init(width: 200, height: 200)
    }

}

//Table
struct ModrenTable: Table {
    func getSize() -> CGSize {
           return CGSize.zero
       }
}

struct VictorianTable: Table {
    func getSize() -> CGSize {
           return CGSize.zero
       }
}

//3 Factory protocol

protocol FurnitureFactory {
    func createChair() -> Chair
    func createTable() -> Table
}

//4 Factories

struct ModrenFurnitureFactory: FurnitureFactory {
    func createChair() -> Chair {
        return ModrenChair()
    }
    
    func createTable() -> Table {
        return ModrenTable()
    }
    
}

struct VictorianFurnitureFactory: FurnitureFactory {
    func createChair() -> Chair {
        return VictorianChair()
    }
    
    func createTable() -> Table {
        return VictorianTable()
    }
}


// Usage
enum FurnitureType {
    case modren
    case victorian
}

struct Client {
    var furniture: FurnitureFactory?
    var chair: Chair?
    var table: Table?
    
    mutating func createFurniture(type: FurnitureType) {
        switch type {
        case .modren:
            furniture = ModrenFurnitureFactory()
        case .victorian:
            furniture = VictorianFurnitureFactory()
        }
        
        chair = furniture?.createChair()
        table = furniture?.createTable()
    }
    
    func printChairSize() {
        print("Chair size: \(chair?.getSize() ?? CGSize.zero)")
    }
}


var client = Client()
client.createFurniture(type: .victorian)
client.printChairSize()
