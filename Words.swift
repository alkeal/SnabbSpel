//
//  Words.swift
//  SnabbSpel
//
//  Created by A on 2023-03-21.
//

import Foundation

struct Word {
    
    let word : String?
}

  // Orden som används i spelet
class listOfWords{
    var word = [
   Word(word: "Alex"),
   Word(word: "David"),
   Word(word: "Hej"),
   Word(word: "Godmorgon"),
   Word(word: "Godnatt"),
   Word(word: "Sverige"),
   Word(word: "Danmark"),
   Word(word: "Finland")]
  
    // blandar dina ord som strängar
    // och ger dig ett av orden
    
    func shuffleWord() -> String? {
           
        let shuffleWords = word.shuffled()
        return shuffleWords.first?.word
        
      
    }
  
    
}
