import UIKit

// 1. Решить квадратное уравнение.
// ax^2 + bx + c = 0
var x1: Double = 0
var x2: Double = 0
var D: Double = 0
 
let a: Double = 4
let b: Double = -18
let c: Double = 8
 
D = b * b - 4 * a * c
 
if D > 0 {
    x1 = (-b + sqrt(D)) / (2 * a)
    x2 = (-b - sqrt(D)) / (2 * a)
    print("X1 = \(x1); X2 = \(x2)")
} else if D == 0 {
    x1 = (-b + sqrt(D)) / (2 * a)
    print("X1 = X2 = \(x1)")
} else {
    print("Has no roots")
}

// 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
let ab: Double = 3
let bc: Double = 4

let hypotenuse = sqrt(pow(ab, 2) + pow(bc, 2))
let s = (ab * bc) / 2.0
let p = ab + bc + hypotenuse

print("Площадь треугольник = \(s), периметр = \(p), гепотенуза = \(hypotenuse)")

// 3. Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через заданный промежуток времени.
var deposit = 100000
let rate = 10
let period = 5
var profit = 0

for _ in 1 ... period {
    let currentProfit = deposit * rate / 100
    profit += currentProfit
    deposit += currentProfit
}

print("Сумма вклада через \(period) лет увелиится на \(profit) и составит \(deposit)")
