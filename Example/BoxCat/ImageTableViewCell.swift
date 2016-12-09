//
//  ImageTableViewCell.swift
//  BoxCat
//
//  Created by Andreas on 30.08.16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    var bundleImage: UIImage? {
        get {
            return bundleImageView.image
        }
        set(newImage) {
            bundleImageView.image = newImage
        }
    }

    var bundleImageName: String? {
        get {
            return bundleImageNameLabel.text
        }
        set(newBundleImageName) {
            bundleImageNameLabel.text = newBundleImageName
        }
    }

    var bundleName: String? {
        get {
            return bundleNameLabel.text
        }
        set(newBundleName) {
            bundleNameLabel.text = newBundleName
        }
    }

    @IBOutlet fileprivate weak var bundleImageView: UIImageView!
    @IBOutlet fileprivate weak var bundleImageNameLabel: UILabel!
    @IBOutlet fileprivate weak var bundleNameLabel: UILabel!
}
