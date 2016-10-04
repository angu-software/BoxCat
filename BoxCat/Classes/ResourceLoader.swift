//
//  ResourceLoader.swift
//  Pods
//
//  Created by Andreas on 20.08.16.
//
//

import UIKit

class ResourceLoader: NSObject {

    static func image(named: String, bundle: Bundle? = nil, searchOptions: SearchOptions = BoxCat.defaultSearchOptions) -> UIImage? {
        
        let bundle = bundle ?? Bundle.main
        
        // find bundle with image
        if let image = UIImage(named: named, in: bundle, compatibleWith: nil) {
            return image
        }
        
        return lookupResource(named: named, in: bundle, searchOptions: searchOptions) { (resourceName, subBundle) -> UIImage? in
            return ResourceLoader.image(named: resourceName, bundle: subBundle)
        }
    }
    
    static func nib(named: String, bundle: Bundle? = nil, searchOptions: SearchOptions = BoxCat.defaultSearchOptions) -> UINib? {
        
        let bundle = bundle ?? Bundle.main
        
        if bundle.path(forResource: named, ofType: "nib") != nil {
            return UINib(nibName: named, bundle: bundle)
        }
        
        return lookupResource(named: named, in: bundle, searchOptions: searchOptions, lookupClosure: { (resourceName, subBundle) -> UINib? in
            return ResourceLoader.nib(named: resourceName, bundle: subBundle)
        })
    }
    
    static func font(named: String, size: CGFloat) -> UIFont? {
        // load dynamically http://www.mokacoding.com/blog/sharing-assets-with-cocoapods-resource-bundle-and-dynamically-loaded-fonts/
        
        return nil
    }
    
    // MARK: private methods
    
    private static func lookupResource<ResourceType>(named: String, in bundle: Bundle, searchOptions: SearchOptions, lookupClosure: (_ resourceName: String, _ subBundle: Bundle) -> ResourceType?) -> ResourceType? {
        
        // TODO: also sort by order specified in the bundlesToSearchOnly
        for subBundle in bundle.bundles.filteredBy(names: searchOptions.bundlesToSearchOnly ?? []) {
            if let resource = lookupClosure(named, subBundle) {
                return resource
            }
        }
        
        // search in frameworks
        for subBundle in bundle.frameworks.filteredBy(names: searchOptions.frameworksToSearchOnly ?? []) {
            if let resource = lookupClosure(named, subBundle) {
                return resource
            }
        }
        
        return nil
    }
    
}
