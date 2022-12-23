//import UIKit
//
//protocol Services {
//    func placeOrder()
//    func getMenus() -> [Menu]
//}
//
//class ThirdPartyFoodServiceGateway: Services {
//    
//    public void placeOrder(Order order) {
//        // assume already implemented
//    }
//    
//    
//    public List<Menu> getMenus() -> [] {
//            // assume already implemented
//        }
//}
//
//class ThirdPartyFoodServiceGateway2: Services {
//    
//    public void placeOrder(Order order) {
//        // assume already implemented
//    }
//    
//    
//    public List<Menu> getMenus() -> [] {
//            // assume already implemented
//        }
//}
//
//enum Type {
//    case .service1
//    case .service2
//    case .all
//    
//}
//
//
//class Factory {
//    
//    
//    static getService(type: Type) -> []
//}
//
//
//class Foodie : Services {
//    
//    let foodServices : [Services]
//    
//    init() {
//        self.foodServices = Factory.getService(type: .all)
//    }
//    
//    public void placeOrder(Order order) {
//        foodService.placeOrder(order)
//    }
//    
//    
//    func getMenus() -> List {
//        var menus = [Menus]()
//        
//        for service in foodServices {
//            menus.apppeng(service.getMenus())
//        }
//        
//        return menus
//    }
//    
//}
//
//// client side
//let foodService = ThirdPartyFoodServiceGateway()
//Foodie foodie = new Foodie();
//foodie.placeOrder(new Order());
//foodie.getMenus()
//
