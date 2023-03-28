//
//  ViewController.swift
//  SnabbSpel
//
//  Created by A on 2023-03-20.
//

import UIKit



  let goToGameSegue = "goToGameSegue"
  let goToResultSegue = "goToResultSegue"


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // Skickar dig till gameviewcontroller alltså själva spelet

    @IBAction func playButton(_ sender: UIButton) {
       
        performSegue(withIdentifier: goToGameSegue, sender: self)
    }
    
    // Denna knapp skickar dig till sidan resultviewcontroller där du kommer när spelet är färdigspelat eller om du vill se reglerna.
    
    @IBAction func resultButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: goToResultSegue, sender: self)
    }
}

