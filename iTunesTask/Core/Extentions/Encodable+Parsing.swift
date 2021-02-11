//
//  Encodable+Parsing.swift
//  FoodicsTask
//
//  Created by Mahmoud Salaheldin on 12/23/20.
//  Copyright © 2020 Mahmoud Salaheldin. All rights reserved.
//


import UIKit

extension Encodable {

    func toDictionary(_ encoder: JSONEncoder = JSONEncoder()) -> [String: Any]? {
        
        do {
            let data = try encoder.encode(self)
            let object = try JSONSerialization.jsonObject(with: data) as? [String : Any]
                        
            return object
            
        } catch {
            
            return nil
        }
    }
}

extension String {

func toDictionary() -> [String : Any?]? {
    
    let data = Data(self.utf8)
    
    do {
        let dictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String : Any?]
        return dictionary
        
    } catch {
        
        return nil
    }
}
}
