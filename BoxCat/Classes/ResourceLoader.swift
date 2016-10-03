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
        
        // search in sub bundles
        for subBundle in bundle.bundles {
            if let image = ResourceLoader.image(named: named, bundle: subBundle) {
                return image
            }
        }
        
        // search in frameworks
        for subBundle in bundle.frameworks {
            if let image = ResourceLoader.image(named: named, bundle: subBundle) {
                return image
            }
        }
        
        return nil
    }
    
    static func nib(named: String, bundle: Bundle? = nil, searchOptions: SearchOptions = BoxCat.defaultSearchOptions) -> UINib? {
        
        let bundle = bundle ?? Bundle.main
        
        if bundle.path(forResource: named, ofType: "nib") != nil {
            return UINib(nibName: named, bundle: bundle)
        }
        
        // search in sub bundles
        for subBundle in bundle.bundles {
            if let nib = ResourceLoader.nib(named: named, bundle: subBundle) {
                return nib
            }
        }
        
        // search in frameworks
        for subBundle in bundle.frameworks {
            if let nib = ResourceLoader.nib(named: named, bundle: subBundle) {
                return nib
            }
        }
        
        return nil
    }
    
    static func font(named: String, size: CGFloat) -> UIFont? {
        // load dynamically http://www.mokacoding.com/blog/sharing-assets-with-cocoapods-resource-bundle-and-dynamically-loaded-fonts/
        
        return nil
    }
}
