//
//  PropertyTests.swift
//  PropertiesTests
//
//  Created by Bo Lin on 3/1/18.
//  Copyright © 2018 Bo Lin. All rights reserved.
//

import XCTest
@testable import Properties

class PropertyRequestTests: XCTestCase {
    
    var propertyArray = NSArray()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        if let path = Bundle.main.path(forResource: "Properties", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, jsonResult["data"] is NSArray {
                    // do stuff
                    propertyArray = jsonResult["data"] as! NSArray
                }
            } catch {
                // handle error
            }
        }
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        propertyArray = NSArray()
        super.tearDown()
    }
    
    func testPropertyInitialzation() {
        var properties = [Property]()
        for propertyData in propertyArray {
            if let property = Property(data: propertyData as? NSDictionary) {
                properties.append(property)
            }
        }
        XCTAssertEqual(properties.count, propertyArray.count)
    }
    
}
