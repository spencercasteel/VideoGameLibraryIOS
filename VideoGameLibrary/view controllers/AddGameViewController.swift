//
//  AddGameViewController.swift
//  VideoGameLibrary
//
//  Created by Spencer Casteel on 10/16/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let genres = ["Action", "RPG", "Puzzle", "survival"]
    
    @IBOutlet weak var gameTitleTextFeild: UITextField!
    @IBOutlet weak var GameDescriptionTextFeild: UITextView!
    @IBOutlet weak var gameRatingSegmentController: UISegmentedControl!
    @IBOutlet weak var genrePickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genres[row]
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func submitButtonTapped(_ sender: Any) {
        guard let title = gameTitleTextFeild.text, title.trimmingCharacters(in: .whitespacesAndNewlines) != "", let gameDescription = GameDescriptionTextFeild.text,  gameDescription.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
            //show an error and return
            return
        }
        
        var rating: String!
        
        switch gameRatingSegmentController.selectedSegmentIndex {
        case 0:
            rating = "E"
        case 1:
            rating = "E10+"
        case 2:
            rating = "T"
        case 3:
            rating = "M"
        case 4:
            rating = "AO"
        default:
            rating = "E"
        }
        
       let genre = genres[genrePickerView.selectedRow(inComponent: 0)]
        
        let newGame = Game(title: title, genre: genre, description: gameDescription, rating: rating)
        
        GameManager.sharedInstance.addGame(game: newGame)
        
        self.performSegue(withIdentifier: "unwindToGameList", sender: self)
    }
}
