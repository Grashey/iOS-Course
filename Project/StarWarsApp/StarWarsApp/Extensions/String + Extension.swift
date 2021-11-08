//
//  String + Extension.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 08.11.2021.
//

import Foundation

extension String {
    var formattedWithSeparator: String {
        let string  = self.replacingOccurrences(of: ",", with: "")
        let number = NumberFormatter().number(from: string)
        return number?.intValue.formattedWithSeparator ?? self
    }
}

extension String {
    var formattedWithPercent: String {
        return self + "%"
    }
}
