//
//  ViewController.swift
//  Shopping List
//
//  Created by Moritz Beyer on 21.12.21.
//  Copyright © 2021 Moritz Beyer. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var testItem = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(selectItem))
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit,
//                                                           target: self,
//                                                           action: #selector(editItem))
        title = "Shopping List"
        
        let defaults = UserDefaults.standard
        
//        if let savedPeople = defaults.object(forKey: "people") as? Data {
//            if let decodedPeople = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedPeople) as? [Person] {
//                people = decodedPeople
//            }
//        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = testItem[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = testItem[indexPath.item]
        
        let ac = UIAlertController(title: "Rename item", message: nil, preferredStyle: .alert)
        
        ac.addTextField()
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        ac.addAction(UIAlertAction(title: "OK", style: .default) { [weak self, weak ac] action in
            guard let answerNew = ac?.textFields?[0].text else { return }
            self?.submitNew(answerNew)
            
            
        })
        
        present(ac, animated: true)
    }
    
    @objc func selectItem() {
        let ac = UIAlertController(title: "Enter answer",
                                   message: nil,
                                   preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit",
                                         style: .default) { [weak self, weak ac] action in
                                            guard let answer = ac?.textFields?[0].text else { return }
                                            self?.submit(answer)
        }

        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
//    @objc func editItem() {
//        let ac = UIAlertController(title: "Edit Item",
//                                   message: nil,
//                                   preferredStyle: .alert)
//        ac.addTextField()
//
//        let submitAction = UIAlertAction(title: "Submit",
//                                         style: .default) { [weak self, weak ac] action in
//                                            guard let answer = ac?.textFields?[0].text else { return }
//                                            self?.submit(answer)
//
//    }
//        ac.addAction(submitAction)
//        present(ac, animated: true)
//
//    }
    
    func submit(_ answer: String) {
        testItem.insert(answer, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    func submitNew (_ answerNew: String) {
        
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        
    }
    
//    func save() {
//        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: testItem, requiringSecureCoding: false) {
//            let defaults = UserDefaults.standard
//            defaults.set(savedData, forKey: "people")
//        }
//    }
}

