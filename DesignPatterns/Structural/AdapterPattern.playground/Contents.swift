import UIKit

protocol Duck {
    func quack()
    func fly()
}

class WildDuck: Duck {
    func quack() {
        print("WildDuck - quack");
    }

    func fly() {
        print("WildDuck - fly");
    }
}

protocol Drone {
    func beep()
    func spinRoters()
    func takeoff()
}

class SuperDrone: Drone {
    func beep() {
        print("SuperDrone - beep");
    }
    
    func spinRoters() {
        print("SuperDrone - spinRoters");
    }
    
    func takeoff() {
        print("SuperDrone - takeoff");
    }
}

class DroneAdapter: Duck {
    let drone: Drone
    
    init(with drone: Drone) {
        self.drone = drone
    }
    
    func quack() {
        drone.beep()
    }
    
    func fly() {
        drone.spinRoters()
        drone.takeoff()
    }
}

func testDuck(_ duck: Duck) {
    duck.quack()
    duck.fly()
}

var duck: Duck = WildDuck()
testDuck(duck)

let drone:Drone = SuperDrone()
duck = DroneAdapter(with: drone)
testDuck(duck)
