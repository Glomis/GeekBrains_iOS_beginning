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
enum Cars: CarProtocol, CustomStringConvertible {
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
    
    var mp3: Bool {
        switch self {
        case .truncCar(let trunc):
            return trunc.mp3
        default:
            return false
        }
    }
    
    var description: String {
        "\(self.brand) \(self.productionYear)"
    }
}

// Queue
struct CarQueue<T: CarProtocol> {
    var queue = [T]()
    
    mutating func push(_ car: T...) {
        queue.append(contentsOf: car)
    }
    
    mutating func pop() -> T? {
        guard !queue.isEmpty else { return nil }
        return queue.removeFirst()
    }
    
    
    mutating func filter(predicate: (T) -> Bool) -> [T] {
        var filteredCars = [T]()
        
        for car in queue {
            if predicate(car) {
                filteredCars.append(car)
            }
        }
        
        return filteredCars
    }
}

// Subscript
extension CarQueue {
    subscript (elements: Int ...) -> Int? {
        var year = 0
        
        for index in elements {
            guard index <= elements.count && index >= 0 else {
                print("Данного индекса нет в массиве"); return nil }
            
            year = self.queue[index].productionYear
            print("Год выпуска машины по данному индексу - \(year)")
        }
        return year
    }
}

// inicialization
let audi = SportCar(brand: "Audi", productionYear: 2020, hatch: true)
let uaz = TruncCar(brand: "UAZ", productionYear: 2015, mp3: false)
let mazda = SportCar(brand: "Mazda", productionYear: 2010, hatch: false)
let maz = TruncCar(brand: "Maz", productionYear: 2018, mp3: true)

// filters
let newCarFilter: (Cars) -> Bool = { cars in
    return cars.productionYear > 2015
}

let withMp3: (Cars) -> Bool = { cars in
    return cars.mp3 == false
}

var carQueue = CarQueue<Cars>()

carQueue.push(.sportCar(audi), .truncCar(uaz), .sportCar(mazda), .truncCar(maz))

let newCars = carQueue.filter(predicate: newCarFilter)

print(newCars)

carQueue[0, 2, 4]
