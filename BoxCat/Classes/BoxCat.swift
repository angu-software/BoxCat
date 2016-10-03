//
//  BoxCat.swift
//  Pods
//
//  Created by Andreas on 01.10.16.
//
//

import Foundation

public struct SearchOptions {
    public let frameworksToSearchOnly: [String]?
    public let bundlesToSearchOnly: [String]?
    
    public init(frameworksToSearchOnly: [String]? = nil, bundlesToSearchOnly: [String]? = nil) {
        self.frameworksToSearchOnly = frameworksToSearchOnly
        self.bundlesToSearchOnly = bundlesToSearchOnly
    }
}

public struct BoxCat {
    public static var defaultSearchOptions = SearchOptions()
}

public extension UIImage {
    public static func named(_ name: String, bundle: Bundle? = nil, searchOptions: SearchOptions = BoxCat.defaultSearchOptions) -> UIImage? {
        return ResourceLoader.image(named: name, bundle: bundle, searchOptions: searchOptions)
    }
}

public extension UINib {
    public static func named(_ name: String, bundle: Bundle? = nil, searchOptions: SearchOptions = BoxCat.defaultSearchOptions) -> UINib? {
        return ResourceLoader.nib(named: name, bundle: bundle, searchOptions: searchOptions)
    }
}
