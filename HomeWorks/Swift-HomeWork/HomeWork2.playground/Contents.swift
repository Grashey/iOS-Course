import UIKit
import Foundation

/**
1. Создать менеджер и протокол для менеджера, которые будут принимать универсальный тип

Ограничить тип протоколом Profile, который будет вызывать метод отображающий в консоль имя и фамилию (реализовать значения через расширения)

Ограничить тип протоколом Adress, который будет отображать в консоль улицу и город

 */

protocol Profile {
    associatedtype ProfileType
    
    func showProfile(profile: ProfileType)
}

protocol Adress {
    associatedtype AdressType
    
    func showAdress(adress: AdressType)
}


class Manager {}
    
extension Manager: Profile {
    typealias ProfileType = String
    
    func showProfile(profile: String) {
        print(profile)
    }
}

extension Manager: Adress {
    typealias AdressType = String
    
    func showAdress(adress: String) {
        print(adress)
    }
}

let manager = Manager()
manager.showProfile(profile: "Ivan Ivanov")
manager.showAdress(adress: "Baker str, London")

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

protocol RequestManager {
    associatedtype Result

    func get() -> Result
}

class NetworkManager<Manager> where Manager:RequestManager {
    
    var requestManager: Manager?
    
    init(requestManager: Manager) {
        self.requestManager = requestManager
    }

    func getAllMovies() {
        requestManager?.get()
    }
}
