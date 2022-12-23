import UIKit
import CoreGraphics

enum TrasmissionType {
    case AUTO
    case MANUAL
}

enum CarType {
    case SPORTS
    case SEDAN
    case NONE

}

class Car : CustomStringConvertible {
    var carType = CarType.NONE
    var numberOfSeats = 0
    var transmissionType = TrasmissionType.AUTO
    var numberOfDoors = 0
    
    var description: String {
        return "Car: \(carType), Transmission: \(transmissionType), Seats: \(numberOfSeats), Doors: \(numberOfDoors)"
    }
}

protocol VehicleBuilder {
    func setNumberOfSeats(seats: Int)
    func setTransmission(type: TrasmissionType)
    func setDoors(doors: Int)
    func getCar() -> Car
}

class SedanCarBuilder: VehicleBuilder {
    
    private var car: Car
    
    init() {
        car = Car()
        car.carType = .SEDAN
    }
    
    func reset() {
        car = Car()
        car.carType = .SEDAN
    }
    
    func getCar() -> Car {
        let newCar = car
        reset()
        return newCar
    }
    
    func setNumberOfSeats(seats: Int) {
        car.numberOfSeats = seats
    }
    
    func setTransmission(type: TrasmissionType) {
        car.transmissionType = type
    }
    
    func setDoors(doors: Int) {
        car.numberOfDoors = doors
    }
}

class SprotsCarBuilder: VehicleBuilder {
    
    private var car: Car
    
    init() {
        car = Car()
        car.carType = .SPORTS
    }
    
    func reset() {
        car = Car()
        car.carType = .SPORTS
    }
    
    func getCar() -> Car {
        let newCar = car
        reset()
        return newCar
    }
    
    func setNumberOfSeats(seats: Int) {
        car.numberOfSeats = seats
    }
    
    func setTransmission(type: TrasmissionType) {
        car.transmissionType = type
    }
    
    func setDoors(doors: Int) {
        car.numberOfDoors = doors
    }
}

class VehicleDirector {
    var builder: VehicleBuilder;
    
    init(builder: VehicleBuilder) {
        self.builder = builder
    }
    
    func setBuilder(builder: VehicleBuilder) {
        self.builder = builder
    }
    
    func createAutoSedanCar() {
        builder.setNumberOfSeats(seats: 4)
        builder.setTransmission(type: .AUTO)
        builder.setDoors(doors: 2)
    }
    
    func createManualSedanCar() {
        builder.setNumberOfSeats(seats: 4)
        builder.setTransmission(type: .MANUAL)
        builder.setDoors(doors: 4)
    }
    
    func createManualSportsCar() {
        builder.setNumberOfSeats(seats: 2)
        builder.setTransmission(type: .MANUAL)
        builder.setDoors(doors: 2)
    }
    
    func getCar() -> Car {
        return builder.getCar()
    }
}

let sedanBuilder = SedanCarBuilder()
let sportsBuilder = SprotsCarBuilder()
var director = VehicleDirector(builder: sedanBuilder)

director.createAutoSedanCar()
print(director.getCar().description)

director.createManualSedanCar()
print(director.getCar().description)

director.setBuilder(builder: sportsBuilder)
director.createManualSportsCar()
print(director.getCar().description)


