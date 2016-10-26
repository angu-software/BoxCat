//
//  BoxCat.swift
//  Pods
//
//  Created by Andreas on 01.10.16.
//
//

import Foundation

public struct LookupFilter {
    public let frameworks: [String]?
    public let bundles: [String]?
    
    public init(frameworks: [String]? = nil, bundles: [String]? = nil) {
        self.frameworks = frameworks
        self.bundles = bundles
    }
}

public struct BoxCat {
    public static var lookupFilter = LookupFilter()
}

public extension UIImage {
    public static func named(_ name: String, bundle: Bundle? = nil, lookupFilter: LookupFilter = BoxCat.lookupFilter) -> UIImage? {
        return ResourceLoader.image(named: name, bundle: bundle, lookupFilter: lookupFilter)
    }
}

public extension UINib {
    public static func named(_ name: String, bundle: Bundle? = nil, lookupFilter: LookupFilter = BoxCat.lookupFilter) -> UINib? {
        return ResourceLoader.nib(named: name, bundle: bundle, lookupFilter: lookupFilter)
    }
}
