//
//  GameViewController.swift
//  SnabbSpel
//
//  Created by A on 2023-03-20.
//

import UIKit




class GameViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var roundsLabel: UILabel!
    @IBOutlet weak var gameTimerLabel: UILabel!
    @IBOutlet weak var pointsCountLabel: UILabel!
    var superTimer : Timer?
    var timeTotal = 10
    var timeLeft = 10
    var counter = 0
    var rounds = 0
    //  let formatter = DateFormatter()
        
    @IBOutlet weak var guessTextView: UITextField!
    
    @IBOutlet weak var writeGuessTextView: UITextField!
    
    
    let listOfwords = listOfWords()
    //var word: [Words]?
    var words1: String = ""
    var words2: String = ""
    var words3: String = ""
    var words4: String = ""
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //shuffleLife()
      // checkAnswerGame()
        stopTimer()
        writeGuessTextView.becomeFirstResponder()
        
       

       
        
        

        
        
        
        
    }
    
    @IBAction func playButton(_ sender: UIButton) {
    
        
     
    }
    
    @objc func timerDown(){
        
        if timeLeft>0{
            timeLeft -= 1
            gameTimerLabel.text = "Tid kvar:  \(timeLeft) "
        }else{
              stopTimer()
            counter = counter + 1
            pointsCountLabel.text = "Dina poäng: \(counter)"
            rounds = rounds + 1
            roundsLabel.text = "Omgång: \(rounds)"
        }
        

    }
    
    func shuffleLife(){
        
        if let shufflemania = listOfwords.shuffleWord(){
            
            guessTextView.text = shufflemania
            
            timeLeft = timeTotal
            gameTimerLabel.text = "Tid kvar:  \(timeLeft) "
            
            superTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerDown), userInfo: nil, repeats: true)
        }
        
    }
    
    
    
    
    func stopTimer(){
        superTimer?.invalidate()
        gameTimerLabel.text = "Tiden är slut!!"
        //gameTimerLabel.text = "\(timeLeft)"
        writeGuessTextView.text = ""
        shuffleLife()
    }
    
    
    
  
    func checkAnswerGame(){
      //  if guessTextView.text == writeGuessTextView.text {
        // }else{

        // }
       guard let word = guessTextView.text,
        let writeWord = writeGuessTextView.text
        else {
            return
        }
    
   }
    
}

