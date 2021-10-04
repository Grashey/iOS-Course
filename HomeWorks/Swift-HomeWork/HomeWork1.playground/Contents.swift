import UIKit

/**
 1. Напишите расширение для коллекций целых чисел, которое возвращает,
 сколько раз определенная цифра фигурирует в любом из его номеров.

  Код [5, 15, 55, 515].testFunc(count: "5") должен возвращать 6.
  Код [5, 15, 55, 515].testFunc(count: "1") должен возвращать 2.
  Код [55555].testFunc(count: "5") должен возвращать 5
  Код [55555].testFunc(count: "1") должен возвращать 0.
 */

extension Array where Element == Int {
    func testFunc(count: Character) -> Element {
        var counter: Int = 0
        self.map { value in
            for char in String(value) {
                if char == count {
                    counter += 1
                }
            }
        }
        return counter
    }
}

let array1 = [5, 15, 55, 515]
let array2 = [55555]
array1.testFunc(count: "5")
array1.testFunc(count: "1")
array2.testFunc(count: "5")
array2.testFunc(count: "1")

/**
 2. Отсортировать массив по длине строк его значений

 ["a", "abc", "ab"].testSorted() должен возвращать ["abc", "ab", "a"].
 */

extension Array where Element == String {
    func testSorted() -> Self {
        return self.sorted(by: {$0 > $1 })
    }
}

let array3 = ["a", "abc", "ab"]
array3.testSorted()

/**
 3. Создайте функцию, которая принимает массив несортированных чисел от 1 до 100,
 где ноль или более чисел могут отсутствовать, и возвращает массив отсутствующих чисел например: 

 var testArray = Array(1...100)
 testArray.remove(at: 25)
 testArray.remove(at: 20)
 testArray.remove(at: 6)

 getMissingNumbers(input: testArray) // [7, 21, 26]
 */

func getMissingNumbers(input: Array<Int>) -> Array<Int> {
    guard let first = input.first, let last = input.last else { return [] }
    let reference = Set(first...last)
    return Set(input).symmetricDifference(reference).sorted()
}

var testArray = Array(1...100)
testArray.remove(at: 25)
testArray.remove(at: 20)
testArray.remove(at: 6)

let diff = getMissingNumbers(input: testArray)

/**
 4. Поменять значения массива местами (не использовать reverse)
 Пример:
 var array = [1, 2, 3]
 array.testReverse()

 */

extension Array where Element == Int {
    func testReverse() -> Array<Element> {
        var ref = self
        var array: [Element] = []
        for _ in ref {
            guard let last = ref.last else { return [] }
            array.append(last)
            ref.removeLast()
        }
        return array
    }
}

var array = [1, 2, 3]
let reversed = array.testReverse()

/**
 Решите проблему сильных ссылок
 */

class Person {
  let name: String
  let email: String
  var car: Car?

  init(name: String, email: String) {
    self.name = name
    self.email = email
  }

  deinit {
    print("Goodbye \(name)!")
  }
}

class Car {
  let id: Int
  let type: String
  weak var owner: Person?

 init(id: Int, type: String) {
   self.id = id
   self.type = type
 }

 deinit {
   print("Goodbye \(type)!")
 }
}

var owner: Person? = Person(name: "Cosmin",
                            email: "cosmin@whatever.com")
var car: Car? = Car(id: 10, type: "BMW")

owner?.car = car
car?.owner = owner

owner = nil
car = nil
print("the owner should be weak")

