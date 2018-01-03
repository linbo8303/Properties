//
//  PropertiesTests.swift
//  PropertiesTests
//
//  Created by Bo Lin on 3/1/18.
//  Copyright © 2018 Bo Lin. All rights reserved.
//

import XCTest
@testable import Properties

class NSDictionaryTests: XCTestCase {
    
    lazy var dirctionary: NSDictionary = [
        "int": 10,
        "string": "string",
        "double": 3.1415,
        "bool": 1,
        "url": "https://google.com.au",
        "dictionary": unitDictionary,
        "array": unitArray
    ]
    
    let unitDictionary: NSDictionary = ["title": "Property"]
    let unitArray: NSArray = ["title", "location"]
    
    
    struct DirectionaryKey {
        static let int = "int"
        static let double = "double"
        static let string = "string"
        static let bool = "bool"
        static let url = "url"
        static let dictionary = "dictionary"
        static let array = "array"
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDoubleValueByKeyPathInDictionary() {
        XCTAssertEqual(dirctionary.double(forKeyPath: DirectionaryKey.double), 3.1415)
    }
    
    func testIntValueByKeyPathInDictionary() {
        XCTAssertEqual(dirctionary.int(forKeyPath: DirectionaryKey.int), 10)
    }
    
    func testStringValueByKeyPathInDictionary() {
        XCTAssertEqual(dirctionary.string(forKeyPath: DirectionaryKey.string), "string")
    }
    
    func testBoolValueByKeyPathInDictionary() {
        XCTAssertEqual(dirctionary.bool(forKeyPath: DirectionaryKey.bool), true)
    }
    
    func testURLValueByKeyPathInDictionary() {
        XCTAssertEqual(dirctionary.url(forKeyPath: DirectionaryKey.url), URL(string: "https://google.com.au"))
    }
    
    func testDictionaryValueByKeyPathInDictionary() {
        XCTAssertEqual(dirctionary.dictionary(forKeyPath: DirectionaryKey.dictionary), unitDictionary)
    }
    
    func testArrayValueByKeyPathInDictionary() {
        XCTAssertEqual(dirctionary.array(forKeyPath: DirectionaryKey.array), unitArray)
    }
    
    
}
