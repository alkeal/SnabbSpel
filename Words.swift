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
class listOfWords{
    var word = [
   Word(word: "Alex"),
Word(word: "David"),
Word(word: "Hej"),
Word(word: "Godmorgon"),
   Word(word: "Godnatt")]
   // init(word:String)
   // {
    //    self.word = word
        
   // }
    
    func shuffleWord() -> String? {
           
        let shuffleWords = word.shuffled()
        return shuffleWords.first?.word
        
         //let words = word,!words.isEmpty{
         //   let randomIndex = Int.random(in: 0..<words.count)
         //   let randomWords = words[randomIndex]
         //   guessTextView.text = randomWords.word
             
             
             
           
    }
  
    
}
