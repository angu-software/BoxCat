//
//  ResourceLoader.swift
//  Pods
//
//  Created by Andreas on 20.08.16.
//
//

import UIKit

public extension UIImage {
    public static func image(name: String, bundle: NSBundle? = nil) -> UIImage? {
        return ResourceLoader.image(name, bundle: bundle)
    }
}

public class ResourceLoader: NSObject {

    public static func image(name: String, bundle: NSBundle? = nil) -> UIImage? {
        
        let bundle = bundle ?? NSBundle.mainBundle()
        
        // find bundle with image
        if let image = UIImage(named: name, inBundle: bundle, compatibleWithTraitCollection: nil) {
            return image
        }
        
        // search in sub bundles
        for subBundle in bundle.bundles {
            if let image = ResourceLoader.image(name, bundle: subBundle) {
                return image
            }
        }
        
        // search in frameworks
        for subBundle in bundle.frameworks {
            if let image = ResourceLoader.image(name, bundle: subBundle) {
                return image
            }
        }
        
        return nil
    }
    
    public static func nib(name: String, bundle: NSBundle? = nil) -> UINib? {
        
        let bundle = bundle ?? NSBundle.mainBundle()
        
        if bundle.pathForResource(name, ofType: "nib") != nil {
            return UINib(nibName: name, bundle: bundle)
        }
        
        // search in sub bundles
        for subBundle in bundle.bundles {
            if let nib = ResourceLoader.nib(name, bundle: subBundle) {
                return nib
            }
        }
        
        // search in frameworks
        for subBundle in bundle.frameworks {
            if let nib = ResourceLoader.nib(name, bundle: subBundle) {
                return nib
            }
        }
        
        return nil
    }
    
    public static func font(name: String, size: CGFloat) -> UIFont? {
        // load dynamically http://www.mokacoding.com/blog/sharing-assets-with-cocoapods-resource-bundle-and-dynamically-loaded-fonts/
        
        return nil
    }
}
