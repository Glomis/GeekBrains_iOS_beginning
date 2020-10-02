import Foundation

// Enums
enum PartState {
    case closeWindow
    case openWindow
    case startEngine
    case stopEngine
    case openDoor
    case closeDoor
    case openHetch
    case closeHetch
}

enum EngineState: String {
    case start = "Двигатель запущен."
    case stop = "Двигатель заглушен."
}

enum WindowState: String {
    case close = "Окно закрыто."
    case open = "Окно открыто."
}

enum DoorState: String {
    case close = "Дверь закрыта."
    case open = "Дверь открыта."
}

enum HatchState: String {
    case close = "Люк закрыт."
    case open = "Люк открыт."
}

enum Transmission: String {
    case manual = "Механическая коробка передач."
    case auto = "Автоматическая коробка передач."
}

enum Trailer: String {
    case small = "Прицеп маленького размера."
    case big = "Преицеп большого размера."
}

// Первоначальный класс - Машина
class Car {
    let brand: String
    let productionYear: Int
    var engineState: EngineState
    var doorState: DoorState
    var windowState: WindowState
    
    init(brand: String, productionYear: Int, engineState: EngineState, windowState: WindowState, doorState: DoorState) {
        self.brand = brand
        self.productionYear = productionYear
        self.engineState = engineState
        self.windowState = windowState
        self.doorState = doorState
    }
    
    func changeState(action: PartState) {
        switch action {
        case .closeDoor:
            doorState = .close
        case .openDoor:
            doorState = .open
        case .closeWindow:
            windowState = .close
        case .openWindow:
             windowState = .open
        case .startEngine:
            engineState = .start
        case .stopEngine:
             engineState = .stop
        default:
            break
        }
    }
    
    func printCarInfo() {
        print("---------------")
        print("Марка машины: \(brand)")
        print("Год выпуска: \(productionYear)")
        print(engineState.rawValue)
        print(doorState.rawValue)
        print(windowState.rawValue)
    }
}

// Спортивная машина
class SportCar: Car {
    
    var hatchState: HatchState
    
    init(brand: String, productionYear: Int, catchState: HatchState) {
        
        self.hatchState = catchState
        super.init(brand: brand, productionYear: productionYear,
                   engineState: .stop, windowState: .close, doorState: .close)
    }
    
    override func changeState(action: PartState) {
        switch action {
        case .closeHetch:
            hatchState = .close
        case .openHetch:
            hatchState = .open
        default:
            super.changeState(action: action)
        }
    }
    
    override func printCarInfo() {
        super.printCarInfo()
        print(self.hatchState.rawValue)
    }
}

// Грузовик
class TrunckCar: Car {
    var transmission: Transmission
    var wheelDrive: Bool
    var trailer: Trailer
    
    init(brand: String, productionYear: Int, engineState: EngineState,
         windowState: WindowState, doorState: DoorState,
         transmission: Transmission, trailer: Trailer) {
        
        self.transmission = transmission
        self.wheelDrive = false
        self.trailer = trailer
        
        super.init(brand: brand, productionYear: productionYear, engineState: engineState, windowState: windowState, doorState: doorState)
    }
    
    func turnOnAWD() {
        wheelDrive = true
    }
    
    func turnOffAWD() {
        wheelDrive = false
    }
    
    override func printCarInfo() {
        super.printCarInfo()
        print(self.transmission.rawValue)
        print(self.wheelDrive == true ? "Полный привод вкючен." : "Полный привод отключен." )
        print(self.trailer.rawValue)
    }
}


// Инициализация
let audi = SportCar(brand: "Audi", productionYear: 2020, catchState: .close)

audi.changeState(action: .openDoor)
audi.changeState(action: .openWindow)
audi.changeState(action: .openHetch)

audi.printCarInfo()

let uaz = TrunckCar(brand: "UAZ", productionYear: 2010, engineState: .stop, windowState: .close, doorState: .close, transmission: .manual, trailer: .big)

uaz.changeState(action: .openWindow)
uaz.changeState(action: .startEngine)
uaz.turnOnAWD()

uaz.printCarInfo()
