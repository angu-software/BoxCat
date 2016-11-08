//
//  BoxCat.swift
//  Pods
//
//  Created by Andreas on 01.10.16.
//
//

import Foundation

/// A filter to specify the destinations _BoxCat_ should look for resources.
/// It will also take into account the order of the defined destinations.
public struct LookupFilter {
    
    // The bundles to lookup for resources
    public let bundles: [String]?
    
    // The frameworks to lookup for resources
    public let frameworks: [String]?
    
    /// Creates a new `LookupFilter`
    ///
    /// - note: _BoxCat_ will return the first occurrence of a resource in the bundle hierarchy,
    ///         therfore it takes into account the order of the framewoks and bundles specified in the lookup 
    ///         filter.
    ///
    /// _BoxCat_ will search contained bundles before searching frameworks.
    ///
    /// - parameter bundles:    The names of the bundles to search for resources.
    ///                         If set to `nil` bundle lookup is skipped.
    ///                         If set to `[]` all contained bundles will be searched. _Default_
    /// - parameter frameworks: The names of the frameworks to search for resources.
    ///                         If set to `nil` framework lookup is skipped.
    ///                         If set to `[]` all contained frameworks will be searched. _Default_
    ///
    /// - returns: A new `LookupFilter`
    public init(bundles: [String]? = [], frameworks: [String]? = []) {
        self.frameworks = frameworks
        self.bundles = bundles
    }
}

public struct BoxCat {
    
    /// Global lookup filter. Defaults to an empty filter.
    /// If set to `nil` resource lookup in contained bundles and framewoks will be skipped.
    public static var lookupFilter: LookupFilter? = LookupFilter()
}

public extension UIImage {
    
    /// Searches for an image resource with a given name in the bundle structure and it's contained frameworks and bundles.
    ///
    /// - parameter name:         Name of the image resource.
    /// - parameter bundle:       A bundle to start the lookup. 
    ///                           If set to `nil` lookup will start at the main bundle. _Default_
    /// - parameter lookupFilter: A filter to narrow the lookup. _Default:_ `BoxCat.lookupFilter`
    ///
    /// - returns: Returns the first image resource found with `name` or `nil` if not found in the bundle hierarchy.
    public static func named(_ name: String, bundle: Bundle? = nil, lookupFilter: LookupFilter? = BoxCat.lookupFilter) -> UIImage? {
        return ResourceLoader.image(named: name, bundle: bundle, lookupFilter: lookupFilter)
    }
}

public extension UINib {
    
    /// Searches for a nib resource with a given name in the bundle structure and it's contained frameworks and bundles.
    ///
    /// - parameter name:         Name of the nib resource.
    /// - parameter bundle:       A bundle to start the lookup.
    ///                           If set to `nil` lookup will start at the main bundle. _Default_
    /// - parameter lookupFilter: A filter to narrow the lookup. _Default:_ `BoxCat.lookupFilter`
    ///
    /// - returns: Returns the first nib resource found with `name` or `nil` if not found in the bundle hierarchy.
    public static func named(_ name: String, bundle: Bundle? = nil, lookupFilter: LookupFilter? = BoxCat.lookupFilter) -> UINib? {
        return ResourceLoader.nib(named: name, bundle: bundle, lookupFilter: lookupFilter)
    }
}
