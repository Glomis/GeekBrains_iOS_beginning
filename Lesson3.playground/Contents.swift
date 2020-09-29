import UIKit

enum Actions {
    case closeDoor, openDoor
    case closeWindow, openWindow
    case startEngine, stopEngine
}

struct SportCar {
    let brand: String
    let yearOfProduction: Int
    var trunkVolume: Double
    var engineState = false
    var windowState = false
    var doorState = false


     mutating func load(_ kg: Double) {
        let freeVolume = trunkVolume - kg
        
        if freeVolume >= 0 {
            trunkVolume -= kg
            print("В багажник загружено \(kg)кг, свободного места осталось \(trunkVolume)кг")
        } else {
            print("Не достоточно места в багажнике")
        }
    }
    
    mutating func unload(_ kg: Double) {
          let freeVolume = trunkVolume + kg
          
          if freeVolume >= trunkVolume {
              trunkVolume += kg
              print("Из багажника выгружено \(kg)кг, свободного места \(trunkVolume)кг")
          } else {
              print("Не достоточно места в багажнике")
          }
      }
    
    
    mutating func doAction(_ action: Actions) {
        switch action {
        case .closeDoor:
            doorState = false
            print("Дверь закрыта")
        case .openDoor:
            doorState = true
            print("Дверь открыта")
        case .closeWindow:
            windowState = false
            print("Окно закрыто")
        case .openWindow:
            windowState = true
            print("Окно открыто")
        case .startEngine:
            engineState = true
            print("Двигатель автомобиля заведен - Wroom! -")
        case .stopEngine:
            engineState = false
            print("Двигатель автомобиля заглушен - Brrr! -")
        }
    }
}

func printDescription(car: SportCar) {
    print("-------------")
    print("Марка авто: \(car.brand)")
    print("Год выпуска: \(car.yearOfProduction)")
    print("Свободное место в багажнике: \(car.trunkVolume)")
    print("Двигатель \(car.engineState == false ? "заглушен" : "заведен")")
    print("Окно \(car.windowState == false ? "закрыто" : "открыто")")
    print("Дверь \(car.doorState == false ? "закрыта" : "открыта")")
}

var newCar = SportCar(brand: "Audi", yearOfProduction: 2010, trunkVolume: 350)

newCar.doAction(.startEngine)
newCar.doAction(.openWindow)
newCar.load(50)
newCar.unload(10)

printDescription(car: newCar)
