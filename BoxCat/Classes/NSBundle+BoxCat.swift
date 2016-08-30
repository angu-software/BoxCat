//
//  NSBundle+BoxCat.swift
//  Pods
//
//  Created by Andreas on 20.08.16.
//
//

import Foundation

extension NSBundle {
    var bundles: [NSBundle] {
        return bundles("bundle")
    }
    
    var frameworks: [NSBundle] {
        return bundles("framework", inDirectory: "Frameworks")
    }
    
    private func bundles(type: String, inDirectory directory: String? = nil) -> [NSBundle] {
        let subBundlePaths = pathsForResourcesOfType(type, inDirectory: directory)
        if let subBundles = subBundlePaths.map({NSBundle(path: $0)!}) as? [NSBundle] {
            return subBundles
        }
        return []
    }
}