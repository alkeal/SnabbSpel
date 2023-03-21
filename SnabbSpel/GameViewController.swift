//
//  GameViewController.swift
//  SnabbSpel
//
//  Created by A on 2023-03-20.
//

import UIKit




class GameViewController: UIViewController {
    
    
    
    @IBOutlet weak var gameTimerLabel: UILabel!
    
    var timer: Timer?
    let formatter = DateFormatter()
    
    
    @IBOutlet weak var guessTextView: UITextField!
    
    var names: Set = ["Alex","Erik","Björn","Älg","Järv"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.timeStyle = DateFormatter.Style.medium
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: gameTimer(timer:))
        
    }
    
    @IBAction func playButton(_ sender: UIButton) {
     
        timer?.invalidate()
     //  let names
        navigationController?.popViewController(animated: true)
   if names.contains("Alex"){
       
       //let name = gameLabelText.text
        
       
   } else {
     //  gameLabelText.text = "Fel svar!"
   }
    }
    
    func gameTimer(timer: Timer){
       
        let date = Date()
        let gameTime = formatter.string(from: date)
        gameTimerLabel.text = gameTime
    }
    deinit{
        timer?.invalidate()
    }

  
}
