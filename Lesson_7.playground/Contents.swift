import UIKit


enum HumanErrors: Error {
    case noMoney
    case notEnough
    
    var localizedDescription: String {
        switch self {
        case .noMoney:
            return "Не хватает денежных средств на данный товар"
        case .notEnough:
            return "Товар закончился"
        }
    }
}


class Product: CustomStringConvertible {
    let price: Double
    let name: String
    var count: Int
    
    var description: String {
        return "\(name)"
    }
    
    init(name: String, price: Double, count: Int) {
        self.name = name
        self.price = price
        self.count = count
    }
}


struct Human {
    let name: String
    var money: Double
    
    
    init(name: String, money: Double) {
        self.name = name
        self.money = money
    }
    
    mutating func buyProduct(_ products: Product ...) -> (pocket: [Product]?, error: HumanErrors?) {
        
        var pr = [Product]()
        
        for item in products {
            guard item.count > 0 else {
                return (pocket: pr, error: .notEnough)
                
            }
            
            guard item.price <= money else {
                return (pocket: pr, error: .noMoney)
            }
            
            money -= item.price
            item.count -= 1
            pr.append(item)
        }
        
        return (pocket: pr, error: nil)
    }
}

extension Human {
    
    mutating func correctBuyProduct(_ products: Product ...) throws -> [Product] {
        
        var pr = [Product]()
        
        for item in products {
            guard item.count > 0 else {
                throw HumanErrors.notEnough
            }
            
            guard item.price <= money else {
                throw HumanErrors.noMoney
            }
            
            pr.append(item)
            money -= item.price
            item.count -= 1
            continue
        }
        
        return pr
    }
}


// inicialization
var jack = Human(name: "Jack", money: 1000)

var apple = Product(name: "Apple", price: 20, count: 5)
var jus = Product(name: "Jus", price: 30, count: 3)


let sell1 = jack.buyProduct(apple, jus)
let sell2 = jack.buyProduct(apple, jus)
let sell3 = jack.buyProduct(apple, jus)
let sell4 = jack.buyProduct(apple, jus)
let sell5 = jack.buyProduct(apple, jus)
let sell6 = jack.buyProduct(apple, jus)

for sale in [sell1, sell2, sell3, sell4, sell5, sell6] {
    guard let pocket = sale.pocket else {
        continue }
    if let error = sale.error {
        print(error.localizedDescription, pocket)
    }
    print( "Купили: \(pocket)")

}

do {
    try jack.correctBuyProduct(apple, jus)
    try jack.correctBuyProduct(apple, jus)
    try jack.correctBuyProduct(apple, jus)
    try jack.correctBuyProduct(apple, jus)
    try jack.correctBuyProduct(apple, jus)
    try jack.correctBuyProduct(apple, jus)
    
} catch let error as HumanErrors {
    print(error.localizedDescription)
}
