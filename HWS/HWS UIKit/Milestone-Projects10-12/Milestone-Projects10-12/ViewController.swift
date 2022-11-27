//
//  ViewController.swift
//  Milestone-Projects10-12
//
//  Created by Moritz Beyer on 11.01.22.
//  Copyright © 2022 Moritz Beyer. All rights reserved.
//
// 1 Designing UICollectionView cells
// 2 UICollectionView data sources
// 3 Importing photos with UIImagePickerController
// 4 Custom subclasses of NSObject
// 5 Connecting up picture

import UIKit

class ViewController: UITableViewController {
    var picture = [Picture]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    // 1 UITableView data source, numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return picture.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        if let cell = cell as? PictureCell {
            
            
    }
    
    return cell
    
    }

}

