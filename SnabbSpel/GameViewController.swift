//
//  GameViewController.swift
//  SnabbSpel
//
//  Created by A on 2023-03-20.
//

import UIKit




class GameViewController: UIViewController, UITextFieldDelegate {
    
    
    
    
    @IBOutlet weak var roundsLabel: UILabel!
    @IBOutlet weak var gameTimerLabel: UILabel!
    @IBOutlet weak var pointsCountLabel: UILabel!
    
    var superTimer : Timer?
    
    var timeTotal = 10
    
    var timeLeft = 10
    
    var countingPoints = 0
    
    var points = 1
    
    var rounds: Int = 0
    
    var roundsTotal: Int = 10
    
    let goToHighScore = "goToHighScore"
    
    let goToEndGame = "goToEndGame"
    
    @IBOutlet weak var guessTextView: UITextField!
    
    @IBOutlet weak var writeGuessTextView: UITextField!
    
    
    let listOfwords = listOfWords()
    
    var words1: String = ""
    var words2: String = ""
    var words3: String = ""
    var words4: String = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        gameFunctions()
        
        writeGuessTextView.becomeFirstResponder()
        
       writeGuessTextView.addTarget(self, action: #selector(CheckSpelling), for: .editingChanged)
   
        
        
        
        
        
        
    }
    
    

    @objc func CheckSpelling(){

     
        guessWord()
        
    }
    
    // spelets funktioner och i vilken ordning de ska användas i.
    func gameFunctions(){
        
        superTimer?.invalidate()
        
        gameTimerLabel.text = "Tiden är slut!!"
        writeGuessTextView.text = ""
        roundsLogic()
        shuffleAllWords()
   
    }
    
    
    
    @IBAction func playButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: goToEndGame, sender: self)

    }
    
    
    // Ger dig en timer som räknar ner från 10 och ger dig en poäng och en ny runda
    // efter varje ord.
    
    
    @objc func timerCountDown(){
        
        
        
        if timeLeft>0 {
            timeLeft -= 1
            gameTimerLabel.text = "Tid kvar:  \(timeLeft) "
            
        } else{
            gameFunctions()
           
        }
        
        
    }
    
    
    // Blandar de olika orden och ger dig en specifik tidsram.
    
    func shuffleAllWords(){
        
        if let shuffleWordList = listOfwords.shuffleWord(){
            
            guessTextView.text = shuffleWordList
            
            timeLeft = timeTotal
            gameTimerLabel.text = "Tid kvar:  \(timeLeft) "
           
            
            superTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCountDown), userInfo: nil, repeats: true)
            
          
          
        }
            
        
    }
    
    
    
    

    
    
   func guessWord(){
        
       guard let word = guessTextView.text,
          let writeWord = writeGuessTextView.text
        else{
           return
           
       }
        if word == writeWord {
            
            gameFunctions()
          
            countingPoints += 1
            
            
            }
              else if word != writeWord{
                  
                 // countingPoints -= 1
                  pointsCountLabel.text = "Dina poäng: \(countingPoints)"
                 
            }
            pointsCountLabel.text = "Dina poäng: \(countingPoints)"
            
   }
    
    


    
    // Ökar rundornas siffror efter rätt svar

func roundsLogic(){
    
    
    
   if rounds < roundsTotal {
      rounds += 1
       
      
      roundsLabel.text = "Omgång: \(rounds)"
       
       
   } else{
     goToHighScoreAndEnd()
       superTimer?.invalidate()
   }
    
    
    
}
    
    // Efter tio rundor ska du bli skickad till nästa viewcontroller, så du kan se dina poäng.
    
    func goToHighScoreAndEnd(){
        
        if let finalPointsVC = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController {
                    finalPointsVC.gamePoints = countingPoints
                    present(finalPointsVC, animated: true, completion: nil)
                }
    
                
      }
    

}
    

