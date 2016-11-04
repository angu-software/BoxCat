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
    
    let mainBundleResource = "img_green"
    let frameworkResource = "img_red"
    let resourceBundleResource = "img_blue"
    
    var mainBundle: Bundle?
    
    override func setUp() {
        super.setUp()
        
        mainBundle = Bundle(for: LookupFilterTests.self)
    }
    
    override func tearDown() {
        mainBundle = nil
        BoxCat.lookupFilter = nil
        super.tearDown()
    }
    
    func testNoLookupFiter() {
        BoxCat.lookupFilter = nil
        
        XCTAssertNotNil(UIImage.named(mainBundleResource, bundle: mainBundle!))
        XCTAssertNil(UIImage.named(frameworkResource, bundle: mainBundle!))
        XCTAssertNil(UIImage.named(resourceBundleResource, bundle: mainBundle!))
    }
    
    func testAllBundlesAndFranworks() {
        BoxCat.lookupFilter = LookupFilter()
        
        XCTAssertNotNil(UIImage.named(mainBundleResource, bundle: mainBundle!))
        XCTAssertNotNil(UIImage.named(frameworkResource, bundle: mainBundle!))
        XCTAssertNotNil(UIImage.named(resourceBundleResource, bundle: mainBundle!))
        
        BoxCat.lookupFilter = LookupFilter(bundles: [], frameworks: [])
        
        XCTAssertNotNil(UIImage.named(mainBundleResource, bundle: mainBundle!))
        XCTAssertNotNil(UIImage.named(frameworkResource, bundle: mainBundle!))
        XCTAssertNotNil(UIImage.named(resourceBundleResource, bundle: mainBundle!))
        
    }
    
    func testBundlesOnlyLookupFiter() {
        BoxCat.lookupFilter = LookupFilter(bundles: [], frameworks: nil)
        
        XCTAssertNotNil(UIImage.named(mainBundleResource, bundle: mainBundle!))
        XCTAssertNil(UIImage.named(frameworkResource, bundle: mainBundle!))
        XCTAssertNil(UIImage.named(resourceBundleResource, bundle: mainBundle!))
    }
    
    func testFrameworksOnlyLookupFiter() {
        BoxCat.lookupFilter = LookupFilter(bundles: nil, frameworks: [])
        
        XCTAssertNotNil(UIImage.named(mainBundleResource, bundle: mainBundle!))
        XCTAssertNotNil(UIImage.named(frameworkResource, bundle: mainBundle!))
        XCTAssertNil(UIImage.named(resourceBundleResource, bundle: mainBundle!))
    }
    
    func testNoBundlesAndFrameworksLookupFiter() {
        BoxCat.lookupFilter = LookupFilter(bundles: nil, frameworks: nil)
        
        XCTAssertNotNil(UIImage.named(mainBundleResource, bundle: mainBundle!))
        XCTAssertNil(UIImage.named(frameworkResource, bundle: mainBundle!))
        XCTAssertNil(UIImage.named(resourceBundleResource, bundle: mainBundle!))
    }
    
    func testOverrideGlobalLookupFilter() {
        BoxCat.lookupFilter = nil
        
        XCTAssertNotNil(UIImage.named(mainBundleResource, bundle: mainBundle!))
        XCTAssertNotNil(UIImage.named(frameworkResource, bundle: mainBundle!, lookupFilter: LookupFilter()))
        XCTAssertNotNil(UIImage.named(resourceBundleResource, bundle: mainBundle!, lookupFilter: LookupFilter()))
    }
}
