//
//  ViewController.swift
//  Challenge 10-13
//
//  Created by Moritz Beyer on 11.01.22.
//  Copyright © 2022 Moritz Beyer. All rights reserved.
//
//Step 1
//

import UIKit

class ViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var pictures = [Photo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPhoto))
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return photo.count
//    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = tableView.dequeueReusableCell(withIdentifier: "Photo", for: indexPath)
        
//        if let section = section as? PhotoSection {
//            section.captionLabel?.text = pictures[indexPath.row].caption
//            let path = Utils.getImageURL(for: pictures[indexPath.row].imageName)
//            section.pictureView?.image = UIImage(contentsOfFile: path.path)
//            section.pictureView?.layer.borderColor = UIColor.black.cgColor
//            section.pictureView?.layer.borderWidth = 0.1
//            section.pictureView?.layer.cornerRadius = 5
//        }
        
        
        return section
    }

    
    
    
    @objc func addNewPhoto() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }

        let imageName = UUID().uuidString
        
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        let photo = Photo(name: "Unknown", image: imageName)
        pictures.append(photo)
        
        

        dismiss(animated: true)
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }


}
