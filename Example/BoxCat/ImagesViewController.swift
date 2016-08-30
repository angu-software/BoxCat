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

    private let imageNames = ["img_green"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK - UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let imageCell = tableView.dequeueReusableCellWithIdentifier("ImageCell", forIndexPath: indexPath) as! ImageTableViewCell
        
        guard let boxCatImage = UIImage.image(imageNames[indexPath.row]) else {
            print("ImagesViewController > ERROR: loading image '\(imageNames[indexPath.row])' failed!")
            return imageCell
        }
        
        imageCell.bundleImage = boxCatImage
        
        return imageCell
    }
}

