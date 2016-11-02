//
//  BoxCat.swift
//  Pods
//
//  Created by Andreas on 01.10.16.
//
//

import Foundation

/// A filter to specify the destinations `BoxCat` should look for resources.
/// It will also take the order into account the lookup destinations are defined.
public struct LookupFilter {
    
    // The frameworks to lookup resources
    public let frameworks: [String]?
    
    // The bundles to lookup resources
    public let bundles: [String]?
    
    /// Creates a new lookup filter
    ///
    /// - note: BoxCat will return the first occurence of an resource in the bundle hierarchy, therfore it takes the order of the framewoks and bundles specified in the lookup filter into account.
    ///
    /// - parameter frameworks: The names of the framewoks to lookup resources. If not specified `BoxCat` lookup resources in all frameworks.
    /// - parameter bundles:    The names of the bundles to lookup resources. If not specified `BoxCat` lookup resources in all frameworks.
    ///
    /// - returns: A new lookup filter
    public init(frameworks: [String]? = nil, bundles: [String]? = nil) {
        self.frameworks = frameworks
        self.bundles = bundles
    }
}

public struct BoxCat {
    
    /// Global lookup filter. Defaults to an empty filter.
    public static var lookupFilter = LookupFilter()
}

public extension UIImage {
    
    /// Searches for an image resource with a given name in the bundle structure and it's contained frameworks and bundles.
    ///
    /// - parameter name:         Name of the image resource.
    /// - parameter bundle:       A bundle to start the lookup. If set to `nil` lookup will start at the main bundlewhich is the default.
    /// - parameter lookupFilter: A filter to narrow the lookup. Defaults to the BoxCat.lookupFilter.
    ///
    /// - returns: Returns the first image resource found with `name` or nil if not found in the bundle hierarchy.
    public static func named(_ name: String, bundle: Bundle? = nil, lookupFilter: LookupFilter = BoxCat.lookupFilter) -> UIImage? {
        return ResourceLoader.image(named: name, bundle: bundle, lookupFilter: lookupFilter)
    }
}

public extension UINib {
    
    /// Searches for an nib resource with a given name in the bundle structure and it's contained frameworks and bundles.
    ///
    /// - parameter name:         Name of the nib resource.
    /// - parameter bundle:       A bundle to start the lookup. If set to `nil` lookup will start at the main bundle which is the default.
    /// - parameter lookupFilter: A filter to narrow the lookup. Defaults to the BoxCat.lookupFilter.
    ///
    /// - returns: Returns the first nib resource found with `name` or nil if not found in the bundle hierarchy.
    public static func named(_ name: String, bundle: Bundle? = nil, lookupFilter: LookupFilter = BoxCat.lookupFilter) -> UINib? {
        return ResourceLoader.nib(named: name, bundle: bundle, lookupFilter: lookupFilter)
    }
}
