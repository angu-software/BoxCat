//
//  ImagesViewController.swift
//  BoxCat
//
//  Created by Andreas Günther on 08/30/2016.
//  Copyright (c) 2016 Andreas Günther. All rights reserved.
//

import UIKit
import BoxCat

class ImagesViewController: UITableViewController {

    fileprivate let imageNames = ["img_green", "img_red", "img_blue"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lookupFilter = LookupFilter(bundles: ["BlueBoxCatResourcesBundle"],
                                        frameworks: ["BlueBoxCat", "RedBoxCat"])
        BoxCat.lookupFilter = lookupFilter
    }
    
    // MARK - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let imageCell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageTableViewCell
        
        guard let boxCatImage = UIImage.named(imageNames[(indexPath as NSIndexPath).row]) else {
            print("ImagesViewController > ERROR: loading image '\(imageNames[(indexPath as NSIndexPath).row])' failed!")
            return imageCell
        }
        
        imageCell.bundleImage = boxCatImage
        
        return imageCell
    }
}

