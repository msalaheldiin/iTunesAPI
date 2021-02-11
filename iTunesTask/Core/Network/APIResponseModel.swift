//
//  APIResponseModel.swift
//   iTunesTask
//
//  Created by Mahmoud Salaheldin on 02/08/20.
//  Copyright © 2020 Mahmoud Salaheldin. All rights reserved.
//

import UIKit
import AnyCodable

class APIResponseModel: BaseModel, Codable {
    
    var resultCount: Int?
    var results: AnyCodable?
}

