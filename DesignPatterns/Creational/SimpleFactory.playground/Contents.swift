import UIKit

enum PizzaType {
    case cheese
    case veggie
}

// Simple Factory

class SimplePizzaFactory {
    
    func createPizza(type: PizzaType) -> Pizza {
        switch type {
        case .cheese:
            return CheesePizza()
        case .veggie:
            return VeggiePizza()
        }
    }
}

// Client

class PizzaSore {
    private let factory: SimplePizzaFactory
    
    init(factory: SimplePizzaFactory) {
        self.factory = factory
    }
        
    func orderPizza(type: PizzaType) -> Pizza {
        let pizza = factory.createPizza(type: type)
        pizza.prepare()
        pizza.bake()
        pizza.cut()
        pizza.box()
        return pizza
    }
}

// Abstract Product

protocol Pizza {
    var description: String { get }
    
    func prepare()
    func bake()
    func cut()
    func box()
}

// Concrete Product

class VeggiePizza: Pizza {
    var description: String = "This is delicious Veggie Pizza"
    
    func prepare() { }
    func bake() { }
    func cut() { }
    func box() { }
}

// Concrete Product

class CheesePizza: Pizza {
    var description: String = "This is delicious Cheese Pizza"
    
    func prepare() { }
    func bake() { }
    func cut() { }
    func box() { }
}


// Usage

let store = PizzaSore(factory: SimplePizzaFactory())
store.orderPizza(type: .cheese).description
store.orderPizza(type: .veggie).description


