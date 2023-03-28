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
    
    var addOrDeletePoints = 0
    
    var points = 5
    
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
    
    // kollar att ordet är ändrat och inom de specifika ramarna för att ge dig poäng eller inte
    // den jämför det två olika textfields.

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
    
    
    // Denna knapp ger dig endast möjligheten att avsluta spelet och komma tillbaka till första viewcontrollern.
    
    @IBAction func playButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: goToEndGame, sender: self)

    }
    
    
    // Ger dig en timer som räknar ner från 10 och ger dig en poäng och en ny runda
    // efter varje ord.
    // Om ordet är felstavat när tiden är ute får du minus fem poäng.
    // dock om du inte har några poäng som får du inga minus den reagerar endast om du har poäng.
  
    @objc func timerCountDown(){
        
        
        
        if timeLeft>0 {
            timeLeft -= 1
            gameTimerLabel.text = "Tid kvar:  \(timeLeft) "
            
        }
       else if (timeLeft == 0) && addOrDeletePoints > 0 {
            addOrDeletePoints -= 5
            pointsCountLabel.text = "Dina poäng: \(addOrDeletePoints)"
     
            gameFunctions()
        }
        else{
            
            gameFunctions()
        }
        
    }
    
    
    // Blandar de olika orden och ger dig en specifik tidsram.
    // som är timeTotal.
    
    func shuffleAllWords(){
        
        if let shuffleWordList = listOfwords.shuffleWord(){
            
            guessTextView.text = shuffleWordList
            
            timeLeft = timeTotal
            gameTimerLabel.text = "Tid kvar:  \(timeLeft) "
           
            
            superTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCountDown), userInfo: nil, repeats: true)
            
          
          
        }
            
        
    }
    
    
    
    

    // Om ordet är rätt ska den ge dig poäng och köra funktionen för spelet
    // och lägga till dina poäng i labeln
    
   func guessWord(){
        
       guard let word = guessTextView.text,
          let writeWord = writeGuessTextView.text
        else{
           return
           
       }
        if word == writeWord {
            
            gameFunctions()
          
            addOrDeletePoints += 5
            
            
            }
              else if word != writeWord{
                  
        
                  pointsCountLabel.text = "Dina poäng: \(addOrDeletePoints)"
                 
            }
            pointsCountLabel.text = "Dina poäng: \(addOrDeletePoints)"
            
   }
    


    
    // Ökar rundornas siffror efter rätt svar, och efter de antal rundorn som är bestämda har varit så går den till resultat viewn.

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
                    finalPointsVC.gamePoints = addOrDeletePoints
                    present(finalPointsVC, animated: true, completion: nil)
                }
    
                
       }

    
    
    
    
    
    
    
    
}
