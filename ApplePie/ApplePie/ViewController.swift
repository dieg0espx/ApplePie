//
//  ViewController.swift
//  ApplePie
//
//  Created by DIEGO ESPINOSA on 2020-04-21.
//  Copyright © 2020 DIEGO ESPINOSA. All rights reserved.
//

import UIKit
var listOfWords = ["mexico","brazil","usa","canada","japan","china","australia","england","germany","spain","italy"]

let incorrectMovesAllowed = 7


class ViewController: UIViewController {
    
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    var totalWins = 0 {
        didSet{
            newRound()
        }
    }

    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    var currentGame: Game!
    
    func newRound(){
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesReaming: incorrectMovesAllowed, guessedLetter: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
        }
    }
        
        func updateUI(){
            var letters = [String]()
            for letter in currentGame.formattedWord{
                letters.append(String(letter))
            }
            let wordWithSpacing = letters.joined(separator: " ")
            correctWordLabel.text = wordWithSpacing
            scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
            treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesReaming)")
        }
        
        @IBAction func buttonPressed(_ sender: UIButton) {
            sender.isEnabled = false
            let letterString = sender.title(for: .normal)!
            let letter = Character(letterString.lowercased())
            currentGame.playerGuessed(letter: letter)
            updateGameState()
        }
        
        func updateGameState(){
            if currentGame.incorrectMovesReaming == 0 {
                totalLosses += 1
            } else if currentGame.word == currentGame.formattedWord{
                totalWins += 1
            } else{
                updateUI()
            }
        }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons{
            button.isEnabled = enable
        }
    }
        
}

