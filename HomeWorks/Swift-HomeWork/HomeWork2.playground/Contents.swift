import UIKit

/**
1. Создать менеджер и протокол для менеджера, которые будут принимать универсальный тип

Ограничить тип протоколом Profile, который будет вызывать метод отображающий в консоль имя и фамилию (реализовать значения через расширения)

Ограничить тип протоколом Adress, который будет отображать в консоль улицу и город

 */

protocol Profile {
    var name: String {get set}
    var lastName: String { get set}
    
    func showProfile()
}

extension Profile {
    func showProfile() {
        print("\(lastName) \(name)")
    }
}

protocol Adress {
    var adress: String {get set}
}

extension Adress {
    var adressDescription: String {
        return adress
    }
}

class Manager: Profile, Adress {
    var name: String
    var lastName: String
    var adress: String
    
    init(name: String, lastName: String) {
        self.name = name
        self.lastName = lastName
        self.adress = ""
    }
}

let manager = Manager(name: "Ivan", lastName: "Ivanov")
manager.adress = "Baker str, London"
manager.showProfile()
print(manager.adressDescription)



/**
 2. Создать класс, который будет иметь опциональное свойство и его тип ввиде протокола.

 Протокол должен иметь ассоциативный тип и метод, вызывающий/принимающий его

 Формат:
 protocol RequestManager {
     associatedtype Result

     func get() -> Result
 }

 class NetworkManager {
     var requestManager: RequestManager?

     func getAllMovies() {
         requestManager.get()
     }
 }
 */


