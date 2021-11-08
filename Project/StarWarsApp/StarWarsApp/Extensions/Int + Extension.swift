//
//  Int + Extension.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 08.11.2021.
//

import Foundation

extension Int {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(from: NSNumber(value: self)) ?? String(self)
    }
}
