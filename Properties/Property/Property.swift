//
//  Property.swift
//  Properties
//
//  Created by Bo Lin on 2/1/18.
//  Copyright © 2018 Bo Lin. All rights reserved.
//

import Foundation

// a simple container class which just holds the data in a Property

public struct Property {
    public let title: String
    public let bedrooms: Int
    public let bathrooms: Int
    public let carspots: Int
    public let description: String
    public let price: Double
    public let isPremium: Bool
    public let owner: Owner
    public let location: Location
    public let photoMediumURL: URL?
    
    
    // MARK: - Internal Implementation
    init?(data: NSDictionary?) {
        guard
            let title = data?.string(forKeyPath: PropertyKey.title),
            let bedrooms = data?.int(forKeyPath: PropertyKey.bedrooms),
            let bathrooms = data?.int(forKeyPath: PropertyKey.bathrooms),
            let carspots = data?.int(forKeyPath: PropertyKey.carspots),
            let description = data?.string(forKeyPath: PropertyKey.description),
            let price = data?.double(forKeyPath: PropertyKey.price),
            let isPremium = data?.bool(forKeyPath: PropertyKey.isPremium),
            let owner = Owner(data: data?.dictionary(forKeyPath: PropertyKey.owner)),
            let location = Location(data: data?.dictionary(forKeyPath: PropertyKey.location))
        else {
            return nil
        }
        
        self.title = title
        self.bedrooms = bedrooms
        self.bathrooms = bathrooms
        self.carspots = carspots
        self.description = description
        self.price = price
        self.isPremium = isPremium
        self.owner = owner
        self.location = location
        self.photoMediumURL = data?.url(forKeyPath: PropertyKey.photoMediumURL)
    }
    
    struct PropertyKey {
        static let title = "title"
        static let bedrooms = "bedrooms"
        static let bathrooms = "bathrooms"
        static let carspots = "carspots"
        static let description = "description"
        static let price = "price"
        static let isPremium = "is_premium"
        static let photoMediumURL = "photo.image.medium.url"
        static let owner = "owner"
        static let location = "location"
    }
    
}
