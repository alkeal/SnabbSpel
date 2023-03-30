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
    let goToHighScore = "goToHighScore"
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        resultFromGame()
    }
    
    // Ger dig diit resultat från din omgång och skickar den via en segue
    
    func resultFromGame(){
        
          resultLabel.text = "Ditt resultat: \(gamePoints)"

        
    }
    
    
    // gör så att du får spela om igen via en segue , poäng och rundor återställs.
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: goToPlayAgain, sender: self)

    }
    
 // När du trycker på highscoren texten ska du komma till en ny viewcontroller som visar de tre senaste omgångarnas poäng
    
    @IBAction func highScoreButton(_ sender: UIButton) {
        
        if let finalPointsVC = storyboard?.instantiateViewController(withIdentifier: "HighScoreViewController") as? HighScoreViewController {
                    finalPointsVC.highScorePoints = gamePoints
                    present(finalPointsVC, animated: true, completion: nil)
                }
        performSegue(withIdentifier: goToHighScore, sender: self)
        
    }
    
}
