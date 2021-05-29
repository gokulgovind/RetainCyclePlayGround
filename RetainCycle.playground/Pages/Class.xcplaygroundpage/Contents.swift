class Vehicle {
    var name:String
    var owner:Person?
    
    init(name:String) {
        self.name = name
    }
    
    deinit {
        print("Vehicle: \(name) is being deinitilized")
    }
}


class Person {
    var name:String
    weak var vehicle:Vehicle?
    
    deinit {
        print("Person: \(name) is being deinitilized")
    }
    
    init(name:String) {
        self.name = name
    }
}

var tesla:Vehicle? = Vehicle(name: "TESLA Model S")
var elon:Person? = Person(name: "Elon Musk")
elon?.vehicle = tesla
tesla?.owner = elon

if let person = elon?.name, let car = elon?.vehicle?.name {
    print("\(person) owns \(car)")
}


elon = nil
tesla = nil
