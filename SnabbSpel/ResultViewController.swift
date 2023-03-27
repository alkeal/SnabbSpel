//
//  ResultViewController.swift
//  SnabbSpel
//
//  Created by A on 2023-03-20.
//

import UIKit

class ResultViewController: UIViewController {
    
    var gamePoints = 0

    let goToPlayAgain = "goToPlayAgain"
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        resultFromGame()
    }
    
    // Ger dig diit resultat från din omgång och skicka via en segue
    
    func resultFromGame(){
        
          resultLabel.text = "Ditt resultat: \(gamePoints)"

        
    }
    
    
    // gör så att du får spela om igen via en segue
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: goToPlayAgain, sender: self)

    }
    
 

}
