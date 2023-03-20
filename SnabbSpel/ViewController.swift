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
        // Do any additional setup after loading the view.
    }

    @IBAction func playButton(_ sender: UIButton) {
       
        performSegue(withIdentifier: goToGameSegue, sender: self)
    }
    
    @IBAction func resultButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: goToResultSegue, sender: self)
    }
}

