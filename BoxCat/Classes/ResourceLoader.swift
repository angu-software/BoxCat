//
//  ResourceLoader.swift
//  Pods
//
//  Created by Andreas on 20.08.16.
//
//

import UIKit

class ResourceLoader: NSObject {

    static func image(named: String, bundle: Bundle? = nil, lookupFilter: LookupFilter?) -> UIImage? {

        let bundle = bundle ?? Bundle.main

        if let image = UIImage(named: named, in: bundle, compatibleWith: nil) {
            return image
        }

        return lookupResource(named: named, in: bundle, lookupFilter: lookupFilter) { (resourceName, subBundle) -> UIImage? in
            return ResourceLoader.image(named: resourceName, bundle: subBundle, lookupFilter: lookupFilter)
        }
    }

    static func nib(named: String, bundle: Bundle? = nil, lookupFilter: LookupFilter?) -> UINib? {

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

    private static func lookupResource<ResourceType>(named: String,
                                       in bundle: Bundle,
                                       lookupFilter: LookupFilter?,
                                       lookupClosure: (_ resourceName: String, _ subBundle: Bundle) -> ResourceType?) -> ResourceType? {

        guard let lookupFilter = lookupFilter else {
            // no lookup filter specified. Ignoring contained bundles and frameworks.
            return nil
        }

        // lookup in contained bundles if the filter is specified.
        if let lookupBundles = lookupFilter.bundles {
            for subBundle in bundle.bundles.sortedIntersectionOfBundlesWith(names: lookupBundles) {
                if let resource = lookupClosure(named, subBundle) {
                    return resource
                }
            }
        }

        // lookup in contained frameworks if the filter is specified.
        if let lookupFrameworks = lookupFilter.frameworks {
            let frameworks = bundle.frameworks.sortedIntersectionOfBundlesWith(names: lookupFrameworks)
            for framework in frameworks {
                if let resource = lookupClosure(named, framework) {
                    return resource
                }
            }
        }

        return nil
    }
}
