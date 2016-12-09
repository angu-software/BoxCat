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
        return subBundlePaths.flatMap({Bundle(path: $0)})
    }
}

extension Array where Element: Bundle {

    func filteredBy(names: [String]) -> [Bundle] {
        if names.count == 0 {
            return self
        }
        return self.filter({ names.contains($0.name) })
    }
}

extension Array where Element: Bundle {

    func sortedIntersectionOfBundlesWith(names: [String]) -> [Bundle] {

        guard names.count > 0 else {
            return self
        }

        let intersection = self.filteredBy(names: names)
        let count = self.count > names.count ? self.count : names.count
        var sortedIntersection = [Bundle?](repeating: nil, count: count)

        for unsortedItem in intersection {
            if let sortedIndex = names.index(of: unsortedItem.name) {
                sortedIntersection[sortedIndex] = unsortedItem
            }
        }
        return sortedIntersection.flatMap({ $0 })
    }
}
