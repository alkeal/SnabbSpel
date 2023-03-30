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
    
    var finalPoints = 0
    
    let userDefaults = UserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()


        
       currentHighScore()
        
    
           
            
        }
        
        
      


    
    // Dina tre föregående resultat ska visas i highscore viewcontrollern.
    
    func currentHighScore(){
        
        
        highScoreLabel.text =  " 1. \(highScorePoints)"
        
    }
    
  //  Med denna funktion ska det nya resultatet du fick läggas till i listan om det är högre än det senaste resultatet.
    
    func addHighScoreToList(){
     
            
            
            
        }
 

    }
    
        

    

  
 

    
    
