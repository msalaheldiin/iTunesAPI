//
//  NetworkingManager.swift
//   iTunesTask
//
//  Created by Mahmoud Salaheldin on 02/08/20.
//  Copyright © 2020 Mahmoud Salaheldin. All rights reserved.
//
import UIKit
import Alamofire


typealias APISuccess = ((_ response: Any?) -> ())?
typealias APIFailure = ((_ response: Any?, _ error: Error?) -> ())?
typealias APIResponseHeaders = ((_ responseHeaders: [AnyHashable : Any?]?) -> ())?

struct NetworkManager {
    
    let timeoutInSeconds: TimeInterval = 300
    
    static let manager: NetworkManager = {
        return NetworkManager()
    }()
    
    func request(endPoint: EndPoint, success: APISuccess, failure: APIFailure, responseHeaders: APIResponseHeaders = nil) {
        
        if !(endPoint.configurations?.handleNetworkActivityIndicatorManually ?? false) {
          //  LoadingIndicator.showNetworkActivityIndicator()
        }
        
        AF.request(endPoint.url,
                   method: httpMethod(forEndPoint: endPoint),
                   parameters: endPoint.parameters,
                   encoding: encoding(forEndPoint: endPoint),
                   headers: httpHeaders(forEndPoint: endPoint)){ $0.timeoutInterval = self.timeoutInSeconds }.validate().responseJSON { response in
                    if !(endPoint.configurations?.handleActivityIndicatorManually ?? false) {
                        // LoadingIndicator.hideActivityIndicator()
                    }
                   
                    responseHeaders?(response.response?.allHeaderFields)
                    
                    if !(endPoint.configurations?.handleNetworkActivityIndicatorManually ?? false) {
                      //  LoadingIndicator.hideNetworkActivityIndicator()
        
                    }
                    
                    if endPoint.configurations?.handleResponseModelManually ?? false {
                        
                        switch response.result {
                            case .success(let value): success?(value)
                            case .failure(let error): failure?(nil, error)
                        }
                        return
                    }
                    
                    do {
                        if let data = response.data, data.count > 0 {
                            
                            let responseModel = try JSONDecoder().decode(APIResponseModel.self, from: data)
                            
                            APIResponseHandler().handleResponse(responseModel, endPoint: endPoint, success: { (model) in
                                success?(model)
                                
                            }) { (responseError, error) in
                                
                                failure?(responseError, response.error)
                            }
                            
                        } else {
                            
                            if !(endPoint.configurations?.handleNetworkErrorsManually ?? false) {
                                SnackBar.showMessage(response.error?.localizedDescription)
                            }
                            
                            failure?(nil, response.error)
                        }
                        
                    } catch {
                        
                        if !(endPoint.configurations?.handleNetworkErrorsManually ?? false) {
                            
                            
                            SnackBar.showMessage(response.error?.localizedDescription)
                        }
                        
                        failure?(nil, response.error)
                    }
        }
    }
    
    func cancelAllRequests() {
        
        let sessionManager = Alamofire.Session.default
        sessionManager.session.getAllTasks { tasks in
            tasks.forEach { $0.cancel() }
        }
    }
    
    func cancelRequestWithURL(url: String) {
        
        let sessionManager = Alamofire.Session.default
        sessionManager.session.getAllTasks { tasks in
            
            tasks.forEach {
                if ($0.originalRequest?.url?.absoluteString.contains(url) ?? false) {
                    $0.cancel()
                }
            }
        }
    }
}


extension NetworkManager {
    
    func httpMethod(forEndPoint endPoint: EndPoint) -> HTTPMethod {
        
        switch endPoint.method {
            
        case .get:
            return HTTPMethod.get
            
        case .post:
            return HTTPMethod.post
            
        case .put:
            return HTTPMethod.put
            
        case .delete:
            return HTTPMethod.delete
        }
    }
    
    func encoding(forEndPoint endPoint: EndPoint) -> ParameterEncoding {
        
        if let encoding = endPoint.encoding {
            
            return parameterEncoding(forAPIEncoding: encoding)
        }
        
        switch endPoint.method {
            
        case .get:
            return URLEncoding.default
            
        case .post:
            return JSONEncoding.default
            
        default:
            return JSONEncoding.default
        }
    }
    
    func parameterEncoding(forAPIEncoding apiEncoding: APIEncoding) -> ParameterEncoding {
        
        switch apiEncoding {
            
        case .url:
            return URLEncoding.default
            
        case .json:
            return JSONEncoding.default
            
        case .query:
            return URLEncoding.queryString

        case .noBrackets:
            return CustomGetEncodingWithoutBrackets()

        }
    }
    
    func httpHeaders(forEndPoint endPoint: EndPoint) -> HTTPHeaders? {
        
        var headers: HTTPHeaders = [:]
        
        headers = defaultHTTPHeaders()
        
        guard let endPointHeaders = endPoint.headers else {
            
            return headers
        }
        
        for header in endPointHeaders {
            headers.add(name: header.key, value: header.value)
        }
        
        return headers
    }
    
    func defaultHTTPHeaders() -> HTTPHeaders {
                
        let headers: HTTPHeaders = []
        return headers
    }
}


extension NetworkManager {
    
    struct CustomGetEncodingWithoutBrackets: ParameterEncoding {
        
        func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
            var request = try! URLEncoding().encode(urlRequest, with: parameters)
            let urlString = request.url?.absoluteString.replacingOccurrences(of: "%5B%5D=", with: "=")
            request.url = URL(string: urlString!)
            return request
        }
    }

}
