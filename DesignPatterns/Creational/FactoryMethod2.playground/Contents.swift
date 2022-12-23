import UIKit
import XCTest

typealias Size = (width: Double, height: Double)

// Procducts

protocol Button {
    var size: Size { get set}
    func render()
}

extension Button {
    func render() {
        print("Default button rendered.")
    }
}

class WindowsButton: Button {
    var size: Size = (0.0, 0.0)
    
    func render() {
        print("Windows button rendered.")
    }
}

class WebButton: Button {
    var size: Size = (0.0, 0.0)
    
    func render() {
        print("Web button rendered.")
    }
}

// Factory Classes

protocol ButtonFactory {
    func createButton(size: Size) -> Button
}

class WindowsButtonFactory: ButtonFactory {
    
    func createButton(size: Size) -> Button {
        let button = WindowsButton()
        button.size = size
        return button
    }
    
}

class WebButtonFactory: ButtonFactory {
    
    func createButton(size: Size)  -> Button {
       let button = WebButton()
        button.size = size
        return button
    }
 
}

// Client class

class Client {
    
    var buttonFactory: ButtonFactory?
    var button: Button?
    
    func setup(factory: ButtonFactory) {
        self.buttonFactory = factory
        button = factory.createButton(size: (10, 10))
    }
    
    func renderButton() {
        button?.render()
    }
}


// Testing

let widnowsClient = Client()
widnowsClient.setup(factory: WindowsButtonFactory())
widnowsClient.renderButton()

let webClient = Client()
webClient.setup(factory: WebButtonFactory())
webClient.renderButton()



