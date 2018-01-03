//
//  Location.swift
//  Properties
//
//  Created by Bo Lin on 2/1/18.
//  Copyright © 2018 Bo Lin. All rights reserved.
//

import Foundation

// container to hold data about a Property location

public struct Location {
    public let address1: String
    public let address2: String
    public let suburb: String
    public let postcode: String
    
    // MARK: - Internal Implementation
    
    public init?(data: NSDictionary?) {
        guard
            let address1 = data?.string(forKeyPath: LocationKey.address1),
            let address2 = data?.string(forKeyPath: LocationKey.address2),
            let suburb = data?.string(forKeyPath: LocationKey.suburb),
            let postcode = data?.string(forKeyPath: LocationKey.postcode)
        else {
            return nil
        }
        
        self.address1 = address1
        self.address2 = address2
        self.suburb = suburb
        self.postcode = postcode
    }
    
    public var address: String { return "\(address1) \(address2) \(suburb), \(postcode)"}
    
    struct LocationKey {
        static let address1 = "address_1"
        static let address2 = "address_2"
        static let suburb = "suburb"
        static let postcode = "postcode"
    }
    
}
