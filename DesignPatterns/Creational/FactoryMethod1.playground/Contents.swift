import UIKit

enum PizzaType {
    case cheese
    case veggie
}

// Abstract Creator

protocol PizzaSore {
    func createPizza(type: PizzaType) -> Pizza // Factory method

    func orderPizza(type: PizzaType) -> Pizza
}

extension PizzaSore {
    
    func orderPizza(type: PizzaType) -> Pizza {
        let pizza = createPizza(type: type)
        pizza.prepare()
        return pizza
    }
}

// Factory Method Creator A

class NYPizzaStore: PizzaSore {
    func createPizza(type: PizzaType) -> Pizza { // Factory method
        
        switch type {
        case .cheese:
            return NYCheesePizza()
        case .veggie:
            return NYVeggiePizza()
        }
        
    }
}

// Factory Method Creator B

class ChicagoPizzaStore: PizzaSore {
    func createPizza(type: PizzaType) -> Pizza { // Factory method
        switch type {
        case .cheese:
            return ChicagoCheesePizza()
        case .veggie:
            return ChicagoVeggiePizza()
        }
    }
}


// Abstract Product

protocol Pizza {
    var description: String { get }
    
    func prepare()
}

// Concrete Product A1

class NYVeggiePizza: Pizza {
    var description: String = "Newyork Veggie Pizza"
    
    func prepare() { }
}

// Concrete Product A2

class NYCheesePizza: Pizza {
    var description: String = "Newyork Cheese Pizza"
    
    func prepare() { }
}


// Concrete Product B1

class ChicagoVeggiePizza: Pizza {
    var description: String = "Chicago Veggie Pizza"
    
    func prepare() { }
}

// Concrete Product B2

class ChicagoCheesePizza: Pizza {
    var description: String = "Chicago Cheese Pizza"
    
    func prepare() { }
}


// Usage

var store: PizzaSore = NYPizzaStore()
store.orderPizza(type: .cheese).description
store.orderPizza(type: .veggie).description

store = ChicagoPizzaStore()
store.orderPizza(type: .cheese).description
store.orderPizza(type: .veggie).description
