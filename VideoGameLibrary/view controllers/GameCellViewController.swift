//
//  GameCellViewController.swift
//  VideoGameLibrary
//
//  Created by Spencer Casteel on 10/18/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import UIKit

class GameCellViewController: UIViewController {
    @IBOutlet weak var gameTitleLabel: UILabel!
    @IBOutlet weak var gameDescriptionLabel: UILabel!
    
    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameTitleLabel.text = game.title
        gameDescriptionLabel.text = game.gameDescription


        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
