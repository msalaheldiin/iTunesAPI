//
//  File.swift
//  CurrencyConverter
//
//  Created by Mahmoud Salaheldin on 12/25/20.
//  Copyright © 2020 Mahmoud Salaheldin. All rights reserved.
//

import Foundation

extension NSObject {
    func propertyNames() -> [String] {
        let mirror = Mirror(reflecting: self)
        return mirror.children.compactMap{ $0.label}
    }
    
    func propertyValues() -> [Double] {
        let mirror = Mirror(reflecting: self)
        return (mirror.children.compactMap{$0.value as? Double})
       }
}
