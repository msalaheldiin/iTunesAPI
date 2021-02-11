//
//  Environment.swift
//   iTunesTask
//
//  Created by Mahmoud Salaheldin on 02/08/20.
//  Copyright © 2020 Mahmoud Salaheldin. All rights reserved.
//

import Foundation


#if DEBUG
let environment: Environment = Environment.testing
#else
let environment: Environment = Environment.production
#endif


enum Environment {
    
    case testing
    case production
    
    
    var baseURL: String {
        
        switch self {
            
        case .testing:
            return "https://itunes.apple.com/"
            
        case .production:
            return "https://itunes.apple.com/"
        }
    }
}
