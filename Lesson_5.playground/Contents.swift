import UIKit

// Enums
enum Engine: String {
    case start = "Двигатель запущен."
    case stop = "Двигатель заглушен."
}

enum Window: String {
    case close = "Окно закрыто."
    case open = "Окно открыто."
}

enum Door: String {
    case close = "Дверь закрыта."
    case open = "Дверь открыта."
}

enum Hatch: String {
    case close = "Люк закрыт."
    case open = "Люк открыт."
}

enum Turbo: String {
    case on = "Турбо включено -> Whroom!"
    case off = "Турбо отключен -> Pffffff!"
}

enum Transmission: String {
    case manual = "Механическая коробка передач."
    case auto = "Автоматическая коробка передач."
}

enum Trailer: String {
    case small = "Прицеп маленького размера."
    case big = "Преицеп большого размера."
}


// Protocol - Car
protocol CarProtocol {
    var brand: String { get }
    var productionYear: Int { get }
    var engineState: Engine { get set }
    var doorState: Door { get set }
    var windowState: Window { get set }
    
    mutating func changeDoorState(to state: Door)
    mutating func changeEngineState(to state: Engine)
    mutating func changeWindowState(to state: Window)
}

// Classes
class SportCar: CarProtocol {
    let brand: String
    let productionYear: Int
    var engineState: Engine = .stop
    var doorState: Door = .close
    var windowState: Window = .close
    var turboState: Turbo = .off
    var hatchState: Hatch = .close
    
    init(brand: String, productionYear: Int) {
        self.brand = brand
        self.productionYear = productionYear
    }
    
    func changeTurboState(to state: Turbo) {
        turboState = state
        print(state.rawValue)
    }
    
    func changeHatchState(to state: Hatch) {
        hatchState = state
        print(state.rawValue)
    }
}

class TruncCar: CarProtocol {
    let brand: String
    let productionYear: Int
    var engineState: Engine = .stop
    var doorState: Door = .close
    var windowState: Window = .close
    var transmission: Transmission
    var trailer: Trailer
    
    init(brand: String, productionYear: Int, transmission: Transmission, trailer: Trailer) {
        self.brand = brand
        self.productionYear = productionYear
        self.transmission = transmission
        self.trailer = trailer
    }
    
    func changeTrailer(to type: Trailer) {
        trailer = type
        print("Подключен \(type.rawValue)")
    }
}


// Extensions
extension CarProtocol {
    mutating func changeDoorState(to state: Door) {
        doorState.self = state
        print(state.rawValue)
    }
    
    mutating func changeWindowState(to state: Window) {
        windowState = state
        print(state.rawValue)
    }
    
    mutating func changeEngineState(to state: Engine) {
        engineState = state
        print(state.rawValue)
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return """
        --------------------------
        Марка машины: \(brand)
        Год выпуска: \(productionYear)
        Состоянеме двигателя: \(engineState.rawValue)
        \(doorState.rawValue)
        \(windowState.rawValue)
        \(hatchState.rawValue)
        \(turboState.rawValue)
        """
    }
}

extension TruncCar: CustomStringConvertible {
    var description: String {
        return """
        --------------------------
        Марка машины: \(brand)
        Год выпуска: \(productionYear)
        Состоянеме двигателя: \(engineState.rawValue)
        \(doorState.rawValue)
        \(windowState.rawValue)
        \(transmission.rawValue)
        \(trailer.rawValue)
        """
    }
}


// Inicialization
var audi = SportCar(brand: "Audi", productionYear: 2020)
audi.changeEngineState(to: .start)
audi.changeHatchState(to: .open)
audi.changeTurboState(to: .on)

var uaz = TruncCar(brand: "UAZ", productionYear: 2017, transmission: .manual, trailer: .small)
uaz.changeEngineState(to: .start)
uaz.changeTrailer(to: .big)


print(audi)
print(uaz)
