import UIKit

protocol VehicleDelegate: class {
    func batteryFull()
}
class Vehicle {
    var name:String
    weak var delegate:VehicleDelegate?
    
    init(name:String) {
        self.name = name
    }
    
    deinit {
        print("Vehicle: \(name) is being deinitilized")
    }
}


class Person: VehicleDelegate{
    var name:String
    var vehicle:Vehicle?
    
    deinit {
        print("Person: \(name) is being deinitilized")
    }
    
    init(name:String, vehicle: Vehicle?) {
        self.name = name
        self.vehicle = vehicle
        self.vehicle?.delegate = self
       
    }
    
    func batteryFull() {
        self.unPlugCharger()
    }
    private func unPlugCharger() {
        print("")
    }
}


var tesla:Vehicle? = Vehicle(name: "TESLA Model S")
var elon:Person? = Person(name: "Elon Musk", vehicle: tesla)

if let person = elon?.name, let car = elon?.vehicle?.name {
    print("\(person) owns \(car)")
}


elon = nil
tesla = nil









