import UIKit

protocol Pizza {
    
    var description: String { get }
    func getDescription() -> String
    func cost() -> Double
}

// Concrete Pizza
class ThinCrustPizza: Pizza {
   
    var description = "ThinCrustPizza"
    
    func getDescription() -> String {
        return description
    }
    
    func cost() -> Double {
        return 5
    }
}

// Concrete Pizza
class ThickCrustPizza: Pizza {
    var description = "ThickCrustPizza"
    
    func getDescription() -> String {
        return description
    }
    
    func cost() -> Double {
        return 8
    }
}

// Toppings Decorator Protocol
protocol Toppings: Pizza {
    var pizza: Pizza { get set }
    init(pizza: Pizza)
}

// Concrete Topping
class Cheese: Toppings {
    var description = "Cheese"
    var pizza: Pizza
    
    required init(pizza: Pizza) {
        self.pizza = pizza
    }
    
    func getDescription() -> String {
        return pizza.getDescription() + " + " + description
    }
    
    func cost() -> Double {
        return pizza.cost() + 1
    }
}

// Concrete Topping
class Olives: Toppings {
    var description = "Olives"
    var pizza: Pizza
    
    required init(pizza: Pizza) {
        self.pizza = pizza
    }
    
    
    func getDescription() -> String {
        return pizza.getDescription() + " + " + description
    }
    
    func cost() -> Double {
        return pizza.cost() + 2
    }
}

var pizza: Pizza = ThickCrustPizza()
pizza = Cheese(pizza: pizza)
pizza = Olives(pizza: pizza)

print(pizza.getDescription())
print("Cost: \(pizza.cost())")
