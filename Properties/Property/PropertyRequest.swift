//
//  PropertyRequest.swift
//  Properties
//
//  Created by Bo Lin on 2/1/18.
//  Copyright © 2018 Bo Lin. All rights reserved.
//

import Foundation
import Alamofire

// Simple Property query class
// Create an instance of it using one of the initializers
// Set the path to fetch properties
public class PropertyRequest {
    public let path: String
    
    // designated initializer
    public init(_ path: String) {
        self.path = path
    }
    
    // send the request specified by our path off to Property
    // calls the handler (not necessarily on the main queue)
    //   with the JSON results converted to a Property List
    public func fetchProperties(handler: @escaping (_ elements: [Property], _ error: Error?) -> Void) {
        var request = URLRequest(url: try! path.asURL())
        request.httpMethod = "GET"
        
        Alamofire.request(path).responseJSON { response in
            var properties = [Property]()
            if response.error != nil {
                handler(properties, response.error)
            } else if let json = response.result.value {
                var propertyArray: NSArray?
                if let dictionary = json as? NSDictionary {
                    if let array = dictionary.value(forKey: PropertyDataKey.data) as? NSArray {
                        propertyArray = array
                    }
                } else if let array = json as? NSArray {
                    propertyArray = array
                }
                if propertyArray != nil {
                    for propertyData in propertyArray! {
                        if let property = Property(data: propertyData as? NSDictionary) {
                            properties.append(property)
                        }
                    }
                }
                handler(properties, response.error)
            }
        }
    }
    
    // keys in Twitter responses/queries
    struct PropertyDataKey {
        static let data = "data"
    }
}
