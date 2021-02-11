//
//  DetailsService.swift
//  iTunesTask
//
//  Created by Mahmoud Salaheldin on 2/8/21.
//  Copyright © 2021 Mahmoud Salaheldin. All rights reserved.
//

import Foundation

class DetailsService: BaseService {
    
    func getSearchResult(term: String?,
                         entity:[String]?,
                         success: APISuccess,
                         failure: APIFailure) {
        
        let parameters: [String : Any]  = ["term": term ?? "",
                                           "entity":entity ?? ""
        ]
        let endPoint = EndPoint(path: API.search,
                                method: .get,
                                parameters: parameters)
        
        NetworkManager.manager.request(endPoint: endPoint, success: success, failure: failure)
    }
}
