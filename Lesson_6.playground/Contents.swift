import UIKit

protocol CarProtocol {
    var brand: String { get }
    var productionYear: Int { get }
}

// Classes
class SportCar: CarProtocol {
    let brand: String
    let productionYear: Int
    var hatch: Bool
    
    init(brand: String, productionYear: Int, hatch: Bool) {
        self.brand = brand
        self.productionYear = productionYear
        self.hatch = hatch
    }
}

class TruncCar: CarProtocol {
    let brand: String
    let productionYear: Int
    var mp3: Bool

    init(brand: String, productionYear: Int, mp3: Bool) {
        self.brand = brand
        self.productionYear = productionYear
        self.mp3 = mp3
    }
}

// Enum with cars
enum Cars: CarProtocol {
    
    case sportCar(SportCar)
    case truncCar(TruncCar)
    
    var brand: String {
        get {
            switch self {
            case .sportCar(let sport):
                return sport.brand
            case .truncCar(let trunc):
                return trunc.brand
            }
        }
    }
    var productionYear: Int {
        get {
            switch self {
            case .sportCar(let sport):
                return sport.productionYear
            case .truncCar(let trunc):
                return trunc.productionYear
            }
        }
    }
}

// Queue
struct CarQueue<T: CarProtocol> {
    var queue = [T]()
    
    mutating func push(_ car: T) {
        queue.append(car)
    }
    
    mutating func pop() -> T? {
        guard queue.count > 0 else { return nil }
        return queue.removeFirst()
    }
}

// inicialization
let audi = SportCar(brand: "Audi", productionYear: 2020, hatch: true)
let uaz = TruncCar(brand: "UAZ", productionYear: 2015, mp3: false)
let mazda = SportCar(brand: "Mazda", productionYear: 2010, hatch: false)
let maz = TruncCar(brand: "Maz", productionYear: 2018, mp3: true)


var queue = CarQueue<Cars>()

queue.push(.sportCar(audi))
queue.push(.truncCar(uaz))
queue.push(.sportCar(mazda))
queue.push(.truncCar(maz))

queue.pop()
queue.pop()
queue.pop()
