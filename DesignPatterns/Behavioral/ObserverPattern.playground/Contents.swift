import UIKit

protocol Observer {
    var tag: String { get }
    func update(data: Any)
}

protocol EventManagable {
    func register(observer : Observer)
    func unRegister(observer : Observer)
}

protocol EventNotifiable {
    func notify(data: Any)
}

typealias Event = EventManagable & EventNotifiable

class EventManager: Event {
    var observers = [Observer]()
    
    func register(observer o: Observer) {
        observers.append(o)
    }
    
    func unRegister(observer o: Observer) {
        observers.removeAll(where: { $0.tag == o.tag})
    }
    
    func notify(data: Any) {
        observers.forEach { $0.update(data: data)}
    }
}

protocol Station: EventManagable {
    init(eventManager: Event)
}

class WeatherStation: Station {
    let eventManager: Event
    var temperature: Double {
        didSet {
            eventManager.notify(data: temperature)
        }
    }
    
    required init(eventManager: Event) {
        self.eventManager = eventManager
        temperature = 0.0
    }
    
    func setTemperature(_ temp: Double) {
        temperature = temp
    }
    
    func register(observer: Observer) {
        eventManager.register(observer: observer)
    }
    
    func unRegister(observer: Observer) {
        eventManager.unRegister(observer: observer)
    }
}

class Logger: Observer {
    var tag = "Logger"
    let station: Station
    
    init(station: Station) {
        self.station = station
        station.register(observer: self)
    }

    func update(data: Any) {
        print("Logger - \(data)")
    }
    
}

class Alert: Observer {
    var tag = "Alert"
    let station: Station
    
    init(station: Station) {
        self.station = station
        station.register(observer: self)
    }
    
    func update(data: Any) {
        print("Alert - \(data)")
    }
}


let eventManager = EventManager()
let station = WeatherStation(eventManager: eventManager)
let logger =  Logger(station: station)
let alert = Alert(station: station)

station.setTemperature(10.0);
station.setTemperature(20.0);

