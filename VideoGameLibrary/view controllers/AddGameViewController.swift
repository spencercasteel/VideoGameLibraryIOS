//
//  AddGameViewController.swift
//  VideoGameLibrary
//
//  Created by Spencer Casteel on 10/16/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UITextViewDelegate{
    
    //array for genres
    let genres = ["Action", "RPG", "Puzzle", "survival"]
    
    @IBOutlet weak var gameTitleTextFeild: UITextField!
    @IBOutlet weak var gameDescriptionTextFeild: UITextView!
    @IBOutlet weak var gameRatingSegmentController: UISegmentedControl!
    @IBOutlet weak var genrePickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameTitleTextFeild.delegate = self
   
    }
    //when touched on screen keyboard goes away
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    //code for picker view
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
    
    //everything that happens when the submit button is pressed
    @IBAction func submitButtonTapped(_ sender: Any) {
        guard let title = gameTitleTextFeild.text, title.trimmingCharacters(in: .whitespacesAndNewlines) != "", let gameDescription = gameDescriptionTextFeild.text,  gameDescription.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
            //show an error and return
            return showErrorAlert()
        }
        
        var rating: String!
        //all rating options
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
        
        //Default initializer for the game class
        let newGame = Game()
        
        
        //setting the properties for the new game using dot notation
        newGame.title = title
        newGame.gameDescription = gameDescription
        newGame.genre = genre
        newGame.rating = rating
        
        GameManager.sharedInstance.addGame(game: newGame)
        
        self.performSegue(withIdentifier: "unwindToGameList", sender: self)
    }
    
    //error alert for when user doesnt enter all data needed
    func showErrorAlert() {
        let alertController = UIAlertController(title: "ERROR", message: "You must enter a title and description for the game.", preferredStyle: .actionSheet)
        let closeAction = UIAlertAction(title: "Close", style: .default) { _ in
            self.gameTitleTextFeild.text = ""
            self.gameDescriptionTextFeild.text = ""
        }
        alertController.addAction(closeAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
