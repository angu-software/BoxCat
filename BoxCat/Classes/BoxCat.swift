//
//  BoxCat.swift
//  Pods
//
//  Created by Andreas on 01.10.16.
//
//

import Foundation

public struct SearchOptions {
    var frameworksToSearchOnly: [String]?
    var bundlesToSearchOnly: [String]?
}

public struct BoxCat {
    public static var defaultSearchOptions = SearchOptions()
}

public extension UIImage {
    public static func named(_ name: String, bundle: Bundle? = nil, searchOptions: SearchOptions = BoxCat.defaultSearchOptions) -> UIImage? {
        return ResourceLoader.image(name, bundle: bundle, searchOptions: searchOptions)
    }
}

public extension UINib {
    public static func named(_ name: String, bundle: Bundle? = nil, searchOptions: SearchOptions = BoxCat.defaultSearchOptions) -> UINib? {
        return ResourceLoader.nib(name, bundle: bundle, searchOptions: searchOptions)
    }
}
