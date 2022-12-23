import UIKit

//enum serviceType{
//    .firebase
//    .mixpanel
//}
//
//protocol Analytics {
//
//    func sendEvent(servevent: String, userInfo: [String: String])
//}
//
//EventManager.sharedInstance.sendEvent(....) {
//
//}
//
//print()
//
//
//
//class EventManager: Analytics {
//
//    static sharedInstance: EventManager
//
//    private firebase: Firbase
//    service
//
//    private init() {
//        sharedInstance = EventManager()
//    }
//
//    func setup() {
//        //todo : setup firbase
//    }
//
//    func sendEvent(event: String, userInfo: [String: String]) {
//        serivce.send(event, userInfo, callback: {
//
//        })
//    }
//
//}


enum ServiceType {
    case firebase
    case mixpanel
}

protocol Analyticable {
    func sendEvent(event: String, userInfo: [String: String])
}

class FirebaseService: Analyticable {
    func sendEvent(event: String, userInfo: [String: String]) {
    }
}

class MixPanaelService: Analyticable {
    func sendEvent(event: String, userInfo: [String: String]) {
    }
}

class EventManager {
    static let sharedInstance = EventManager()
    private var serviceDict: [ServiceType: Analyticable]
    
    private init() {
        serviceDict = [
            .firebase: FirebaseService(),
            .mixpanel: MixPanaelService()
        ]
    }
    
    func sendEvent(services: [ServiceType]? = nil, event: String, userInfo: [String: String]) {
        
        if let services = services, !services.isEmpty {
            
            for s in services {
                let service = serviceDict[s]
                service?.sendEvent(event: event, userInfo: userInfo)
            }
            return
        }
      
        for service in serviceDict.values {
            service.sendEvent(event: event, userInfo: userInfo)
        }
    }
}

