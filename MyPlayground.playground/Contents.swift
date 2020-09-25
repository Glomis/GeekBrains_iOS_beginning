import UIKit

// 1. Написать функцию, которая определяет, четное число или нет.
func isEven(_ number: Int) -> Bool {
    if number % 2 == 0 {
        return true
    } else {
        return false
    }
}

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3
func multipleOfThree(_ number: Int) -> Bool {
    return number % 3 == 0 ? true : false
}

// 3. Cоздать возрастающий массив из 100 чисел
var array = Array(1...100)


// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3
func sortArray(from array: [Int]) -> [Int] {
    var sortedArray: [Int] = []
    
    for number in array {
        if !isEven(number) && !multipleOfThree(number) {
            sortedArray.append(number)
        }
    }
    return sortedArray
}

let sortedArray = sortArray(from: array)

// 5. Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов
func fibonacchi(n: Int) -> [Int] {
    var x = -1 ,y = 1, sum = 0
    
    var array = [Int]()
    
    for _ in 0..<n {
        sum = x+y
        x   = y
        y   = sum
        array.append(sum)
    }
    return array
}

let fib = fibonacchi(n: 90)


