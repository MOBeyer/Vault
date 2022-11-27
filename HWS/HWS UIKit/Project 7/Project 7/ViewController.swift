//
//  ViewController.swift
//  Project 7
//
//  Created by Moritz Beyer on 04.01.22.
//  Copyright © 2022 Moritz Beyer. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(promptForAnswer))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                            target: self,
                                                            action: #selector(searchForPetition))
        
        let urlString: String
        
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            }
        }

        showError()
    }
    
    @objc func promptForAnswer() {
        let ac = UIAlertController(title: "API", message: "https://www.hackingwithswift.com/samples/petitions-1.json", preferredStyle: .alert)
        
        let submitAction = UIAlertAction(title: "Submit", style: .default, handler: nil)
        
        ac.addAction(submitAction)
        present(ac, animated: true)

    }
    
   @objc func searchForPetition() {
        let ac = UIAlertController(title: "Search Petitions", message: nil, preferredStyle: .alert)
        ac.addTextField()
    
    let submitSearch = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
        guard let answer = ac?.textFields?[0].text else { return }
        self?.submit(answer)
        }

    
        ac.addAction(submitSearch)
        present(ac, animated: true)
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        
        
    }
    
    
    func submit(_ answer: String) {
        
    }
    
 }



