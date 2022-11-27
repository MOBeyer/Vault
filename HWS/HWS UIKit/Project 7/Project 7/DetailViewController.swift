//
//  DetailViewController.swift
//  Project 7
//
//  Created by Moritz Beyer on 04.01.22.
//  Copyright © 2022 Moritz Beyer. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Petition?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(promptForAnswer2))
        
        guard let detailItem = detailItem else { return }
        
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style> body { font-size: 150%; } </style>
        </head>
        <body>
        \(detailItem.body)
        </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)  
    }
    
    @objc func promptForAnswer2() {
        let ac = UIAlertController(title: "API", message: "https://www.hackingwithswift.com/samples/petitions-1.json", preferredStyle: .alert)
        
        let submitAction = UIAlertAction(title: "Submit", style: .default, handler: nil)
        
        ac.addAction(submitAction)
        present(ac, animated: true)
        
    }
}
