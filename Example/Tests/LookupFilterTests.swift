//
//  LookupFilterTests.swift
//  BoxCat
//
//  Created by Andreas on 03.11.16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest
@testable import BoxCat

class LookupFilterTests: XCTestCase {
    
    var mainBundle: Bundle?
    
    override func setUp() {
        super.setUp()
        
        mainBundle = Bundle(for: LookupFilterTests.self)
    }
    
    override func tearDown() {
        mainBundle = nil
        super.tearDown()
    }
    
    func testNoLookupFiter() {
        
    }
    
    func testNoFramewokLookupFiter() {
        
    }
    
    func testNoBundleLookupFiter() {
        
    }
    
    func testEmptyFramewokLookupFiter() {
        
    }
    
    func testEmptyBundleLookupFiter() {
        
    }
    
}
