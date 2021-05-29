import UIKit


class Vechicle {
    var name:String
    var batteryFull:(()->())?
    
    init(name:String) {
        self.name = name
    }
    
    deinit {
        print("Vechicle: \(name) is being deinitilized")
    }
}


class Person {
    var name:String
    var vechicle:Vechicle?
    
    deinit {
        print("Person: \(name) is being deinitilized")
    }
    
    init(name:String, vehicle: Vechicle?) {
        self.name = name
        self.vechicle = vehicle
        vechicle?.batteryFull = { [weak self] in
            self?.unPlugCharger()
        }
    }
    func unPlugCharger() {}
}


var tesla:Vechicle? = Vechicle(name: "TESLA Model S")
var elon:Person? = Person(name: "Elon Musk", vehicle: tesla)

if let person = elon?.name, let car = elon?.vechicle?.name {
    print("\(person) owns \(car)")
}


elon = nil
tesla = nil









