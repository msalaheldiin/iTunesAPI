//
//  APIResponseHandler.swift
//   iTunesTask
//
//  Created by Mahmoud Salaheldin on 02/08/20.
//  Copyright © 2020 Mahmoud Salaheldin. All rights reserved.
//


import UIKit

class APIResponseHandler: NSObject {
    
    func handleResponse(_ responseModel: APIResponseModel, endPoint: EndPoint, success: APISuccess, failure: APIFailure) {
        let result = responseModel.results?.value

        if (responseModel.resultCount ?? 0) > 0  {
            success?(result)
       }
    }
}
