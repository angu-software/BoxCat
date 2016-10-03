//
//  NSBundle+BoxCat.swift
//  Pods
//
//  Created by Andreas on 20.08.16.
//
//

import Foundation

extension Bundle {
    var bundles: [Bundle] {
        return bundles("bundle")
    }
    
    var frameworks: [Bundle] {
        return bundles("framework", inDirectory: "Frameworks")
    }
    
    fileprivate func bundles(_ type: String, inDirectory directory: String? = nil) -> [Bundle] {
        let subBundlePaths = paths(forResourcesOfType: type, inDirectory: directory)
        if let subBundles = subBundlePaths.map({Bundle(path: $0)!}) as? [Bundle] {
            return subBundles
        }
        return []
    }
}
