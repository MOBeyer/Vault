//
//  ViewController.swift
//  Project 5
//
//  Created by Moritz Beyer on 17.12.21.
//  Copyright © 2021 Moritz Beyer. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var allWords = [String]() //! all words in input file
    var usedWords = [String]() //! used word

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /// create UIBarButtonItem using "at" system
        /// configure to run method "promtForAnswer"
        /// shows "UIAlertController" with space to enter an answer
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(promptForAnswer))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(startgame))
        //navigationItem.leftBarButtonItem = UIBarButtonItem
        
        //? Where is start txt in the file sytem? Finding path to txt file
        //! Build in method with Bundle
        // Loading file into a string
        
        //! unwrap optional using if let syntax
        
        if let startWordsURL = Bundle.main.url(forResource: "start",
                                               withExtension: "txt") { //! either pack or nil
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n") //! breaking up single array using line break \n
            }
        }
        
        if allWords.isEmpty {
            allWords = ["silkworm"]
            
            
        }
        
        startGame()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
    func startGame() {
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    //! Strong reference cycle? , trailing closure syntax
    /// create "promt for Answer method called by "UIBarButtonItem"
    /// create "UIAlertController" "ac"
    /// add input field "addTextField()"
    @objc func startgame() {
        let sg = startGame()
        let ac = UIAlertController(title: "Try it!", message: "Help", preferredStyle: .alert)
    
        present(ac, animated: false)
    }
    
    
    @objc func promptForAnswer() {
        let ac = UIAlertController(title: "Enter answer",
                                   message: nil,
                                   preferredStyle: .alert)
        ac.addTextField()
        
        /// creating trailing closure syntax
        /// read out "TextField"
        /// use "weak self", "weak ac"
        let submitAction = UIAlertAction(title: "Submit",
                                         style: .default) {
                                            [weak self, weak ac] action in
                                            
                                            /// unwrap "textFields"
                                            /// pull text from "textField"
                                            /// pass text to "submit()"
                                            guard let answer = ac?.textFields?[0].text
                                                else { return }
            self?.submit(answer)
        }
        
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    
    func isPossible(word: String) -> Bool {
        guard var tempWord = title?.lowercased() else { return false }
        
        for letter in word {
            if let position = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: position)
            } else {
                return false
            }
        }
        
        return true
}

    
    func isOriginal(word: String) -> Bool {
        return !usedWords.contains(word)
    }
    
    func isReal(word: String) -> Bool {
        
        let checker = UITextChecker()
        
        let range = NSRange(location: 0,
                            length: word.utf16.count)
        
        let misspelledRange = checker.rangeOfMisspelledWord(in: word,
                                                            range: range,
                                                            startingAt: 0,
                                                            wrap: false,
                                                            language: "en")
            if word.count > 3 {
            } else {
                return false
            }
        
        

    
        
        return misspelledRange.location == NSNotFound
}

    /// compile "submit"
    func submit(_ answer: String) {
        let lowerAnswer = answer.lowercased()
        
        let errorTitle: String
        let errorMessage: String
        
        /// nested statements
        if isPossible(word: lowerAnswer) {
            if isOriginal(word: lowerAnswer) {
                if isReal(word: lowerAnswer) {
                    usedWords.insert(answer, at: 0)
                    
                    let indexPath = IndexPath(row: 0, section: 0)
                    tableView.insertRows(at: [indexPath], with: .automatic)
                    return
                    
                } else {
                    errorTitle = "Word not recognised"
                    errorMessage = "You can't just make them up, you know!"
                }
            } else {
                errorTitle = "Word used already"
                errorMessage = "Be more original!"
            }
        } else {
            guard let title = title?.lowercased() else { return }
            errorTitle = "Word not possible"
            errorMessage = "You can't spell that word from \(title)"
        }
        
        let ac = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    
}
