//
//  NSBundle+BoxCat.swift
//  Pods
//
//  Created by Andreas on 20.08.16.
//
//

import Foundation

extension Bundle {
    
    var name: String {
        let bundleURL = URL(fileURLWithPath: self.bundlePath, isDirectory: true)
        let fileName = bundleURL.lastPathComponent
        let name = fileName.replacingOccurrences(of: ".\(bundleURL.pathExtension)", with: "")
        return name
    }
    
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

extension Array where Element: Bundle {
    func filteredBy(names: [String]) -> [Bundle] {
        
        if names.count == 0 {
            return self
        }
        return self.filter({names.contains($0.name)})
    }
}
