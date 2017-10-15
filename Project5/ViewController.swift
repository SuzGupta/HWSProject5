//
//  ViewController.swift
//  Project5
//
//  Created by Susannah Skyer Gupta on 10/10/17.
//  Copyright © 2017 Susannah Skyer Gupta. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UITableViewController {
    
 // what do the open parentheses mean here?
    var allWords = [String]()
    var usedWords = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let startWordsPath = Bundle.main.path(forResource: "start", ofType: "txt") {
            if let startWords = try? String(contentsOfFile: startWordsPath) {
                allWords = startWords.components(separatedBy: "\n")
            }
        } else {
            allWords = ["silkworm"]
        }
//        if let startWordsPath = Bundle.main.path(forResource: "start", ofType: "txt") {
//            if let startWords = try? String(contentsOfFile: startWordsPath) {
//                allWords = startWords.components(separatedBy: "\n")
//            }
//            else {
//                allWords = ["silkworm"]
//            }
//            print(allWords)
//        }
        func startGame() {
            allWords = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: allWords) as! [String]
            print(allWords)
            title = allWords[0]
            print(title)
            usedWords.removeAll(keepingCapacity: true)
            tableView.reloadData()
        }
        
        startGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

