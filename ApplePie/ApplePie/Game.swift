//
//  Game.swift
//  ApplePie
//
//  Created by DIEGO ESPINOSA on 2020-04-21.
//  Copyright © 2020 DIEGO ESPINOSA. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesReaming: Int
    var guessedLetter: [Character]
    mutating func playerGuessed(letter: Character){
        guessedLetter.append(letter)
        if !word.contains(letter){
            incorrectMovesReaming -= 1
        }
    }
    
    var formattedWord: String{
        var guessedWord = ""
        for letter in word {
            if guessedLetter.contains(letter){
                guessedWord += "\(letter)"
            }else{
                guessedWord += "_"
            }
        }
        return guessedWord
    }
}
