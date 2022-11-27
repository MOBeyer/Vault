//
//  ViewController.swift
//  Challange Project 1-3
//
//  Created by Moritz Beyer on 16.12.21.
//  Copyright © 2021 Moritz Beyer. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    //Array of strings
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //! constant called fm- look for files
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        //! This is a loop
        for item in items {
            if item.hasSuffix("png") {
                pictures.append(item)
            }
        // Do any additional setup after loading the view, typically from a nib.
    }
        print(pictures)
}
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    }
