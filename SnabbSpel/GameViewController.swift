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
    
    var countingPoints = 1
    
    var points = 0
    
    var rounds = 0
    
    var roundsTotal = 10
    
    
    @IBOutlet weak var guessTextView: UITextField!
    
    @IBOutlet weak var writeGuessTextView: UITextField!
    
    
    let listOfwords = listOfWords()
    
    var words1: String = ""
    var words2: String = ""
    var words3: String = ""
    var words4: String = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       //stopTimer()
        //writeGuessTextView.delegate = self
        stopTimer()
        
        writeGuessTextView.becomeFirstResponder()
        
       writeGuessTextView.addTarget(self, action: #selector(Check), for: .editingChanged)
   
        
        
        
        
        
        
    }

    @objc func Check(){
      // stopTimer()
     
        guessWord()
        
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        
        
        
    }
    
    
    // Ger dig en timer som räknar ner från 10 och ger dig en poäng och en ny runda
    // efter varje ord.
    
    
    @objc func timerDown(){
        
        
        
        if timeLeft>0 {
            timeLeft -= 1
            gameTimerLabel.text = "Tid kvar:  \(timeLeft) "
            
        } else{
            stopTimer()
            
        }
        
        
    }
    
    
    // Blandar de olika orden och ger dig en specifik tidsram.
    
    func shuffleLife(){
        
        if let shufflemania = listOfwords.shuffleWord(){
            
            guessTextView.text = shufflemania
            
            timeLeft = timeTotal
            gameTimerLabel.text = "Tid kvar:  \(timeLeft) "
        
            
            superTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerDown), userInfo: nil, repeats: true)
            
          
            //rounds = roundsTotal
            // gameTimerLabel.text = "Spelet är slut!"
        }
        
    }
    
    
    
    
    func stopTimer(){
        superTimer?.invalidate()
        
        gameTimerLabel.text = "Tiden är slut!!"
        //gameTimerLabel.text = "\(timeLeft)"
        writeGuessTextView.text = ""
        shuffleLife()
       // guessWord()
        rounds = rounds + 1
        roundsLabel.text = "Omgång: \(rounds)"
        
    }
    
    
   func guessWord(){
        
       guard let word = guessTextView.text,
          let writeWord = writeGuessTextView.text
        else{
           return
           
       }
        if word == writeWord {
            
           // shuffleLife()
            stopTimer()
            points += 1
           
            
             
            }
            else {
                
               points -= 1
                
            }
            pointsCountLabel.text = "Dina poäng: \(countingPoints)"
            
        }
        
    }
    

