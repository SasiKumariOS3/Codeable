//
//  WebServiceHandler.swift
//  MySampleExp
//
//  Created by sasi on 20/11/18.
//  Copyright © 2018 InfoWave. All rights reserved.
//

import UIKit

class WebServiceHandler: NSObject {
    
    typealias CompletionHandlerOne = ( _ responseData: Data?, _ error: Error?) -> Void
    typealias CompletionHandlerTwo = ( _ data: Data, _ response: URLResponse, _ error: Error) -> Void

    func fetchMethodOneApiRequestResponse(strurl : String, completion: @escaping CompletionHandlerOne) {
        
        var request = URLRequest(url: URL(string: strurl)!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            
            guard let data = data, error == nil else {
                return
            }
            do {
                guard (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) != nil else {
                    completion(nil,error)
                    return
                }
                completion(data,"" as? Error)
            }
        }).resume()
    }
    
    
    
}


