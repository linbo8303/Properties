//
//  Owner.swift
//  Properties
//
//  Created by Bo Lin on 2/1/18.
//  Copyright © 2018 Bo Lin. All rights reserved.
//

import Foundation

// container to hold data about a Property owner

public struct Owner {
    public let firstName: String
    public let lastName: String
    public let avatarMediumURL: URL?
    
    public var fullName: String { return "\(firstName) \(lastName)" }
    
    // MARK: - Internal Implementation
    
    public init?(data: NSDictionary?) {
        guard
            let firstName = data?.string(forKeyPath: OwnerKey.firstName),
            let lastName = data?.string(forKeyPath: OwnerKey.lastName)
        else {
            return nil
        }
        
        self.firstName = firstName
        self.lastName = lastName
        self.avatarMediumURL = data?.url(forKeyPath: OwnerKey.avatarMediumURL)
    }
    
    struct OwnerKey {
        static let firstName = "first_name"
        static let lastName = "last_name"
        static let avatarMediumURL = "avatar.medium.url"
    }
    
}
