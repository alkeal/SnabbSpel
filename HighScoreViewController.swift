//
//  HighScoreViewController.swift
//  SnabbSpel
//
//  Created by A on 2023-03-29.
//

import UIKit

class HighScoreViewController: UIViewController {
    
    
    
    @IBOutlet weak var highScoreLabel: UILabel!
    
    
    
    // poängen som skickas från resultat viewcontrollern
    var highScorePoints = 0
    
   
    
    let userDefaults = UserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()


     
          // highScorePoints =  UserDefaults.standard.integer(forKey: "highScore")
            highScoreLabel.text =  " 1. \(highScorePoints)"
       
        
        
        }
      


    
    // Dina tre föregående resultat ska visas i highscore viewcontrollern.
    
    func currentHighScore(){
        
        
        highScorePoints = UserDefaults.standard.integer(forKey: "highScore")
        highScoreLabel.text =  " 1. \(highScorePoints)"
            
        
    
    }
    
            
            
        }
 

    
    
        

    

  
 

    
    
    
