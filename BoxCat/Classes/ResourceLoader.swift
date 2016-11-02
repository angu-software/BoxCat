//
//  ResourceLoader.swift
//  Pods
//
//  Created by Andreas on 20.08.16.
//
//

import UIKit

class ResourceLoader: NSObject {

    static func image(named: String, bundle: Bundle? = nil, lookupFilter: LookupFilter) -> UIImage? {
        
        let bundle = bundle ?? Bundle.main
        
        if let image = UIImage(named: named, in: bundle, compatibleWith: nil) {
            return image
        }
        
        return lookupResource(named: named, in: bundle, lookupFilter: lookupFilter) { (resourceName, subBundle) -> UIImage? in
            return ResourceLoader.image(named: resourceName, bundle: subBundle, lookupFilter: lookupFilter)
        }
    }
    
    static func nib(named: String, bundle: Bundle? = nil, lookupFilter: LookupFilter) -> UINib? {
        
        let bundle = bundle ?? Bundle.main
        
        if bundle.path(forResource: named, ofType: "nib") != nil {
            return UINib(nibName: named, bundle: bundle)
        }
        
        return lookupResource(named: named, in: bundle, lookupFilter: lookupFilter, lookupClosure: { (resourceName, subBundle) -> UINib? in
            return ResourceLoader.nib(named: resourceName, bundle: subBundle, lookupFilter: lookupFilter)
        })
    }
    
    static func font(named: String, size: CGFloat) -> UIFont? {
        // load dynamically http://www.mokacoding.com/blog/sharing-assets-with-cocoapods-resource-bundle-and-dynamically-loaded-fonts/
        
        return nil
    }
    
    // MARK: private methods
    
    private static func lookupResource<ResourceType>(named: String, in bundle: Bundle, lookupFilter: LookupFilter, lookupClosure: (_ resourceName: String, _ subBundle: Bundle) -> ResourceType?) -> ResourceType? {
        
        for subBundle in bundle.bundles.sortedIntersectionOfBundlesWith(names: lookupFilter.bundles ?? []) {
            if let resource = lookupClosure(named, subBundle) {
                return resource
            }
        }
        
        // search in frameworks
        for subBundle in bundle.frameworks.sortedIntersectionOfBundlesWith(names: lookupFilter.frameworks ?? []) {
            if let resource = lookupClosure(named, subBundle) {
                return resource
            }
        }
        
        return nil
    }
}
