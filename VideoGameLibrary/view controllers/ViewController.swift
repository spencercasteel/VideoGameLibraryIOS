//
//  ViewController.swift
//  VideoGameLibrary
//
//  Created by Spencer Casteel on 10/15/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var gameArray = [VideoGame(title: "Halo 2", genre: "shooter", description: "", rating: "M"), VideoGame(title: "Portal 2", genre: "Puzzel", description: "", rating: "M")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell") as! GameTableViewCell
        
        let currentGame = gameArray[indexPath.row]
        
        cell.titleLabel.text = gameArray[indexPath.row].title
        cell.genreLabel.text = gameArray[indexPath.row].genre
        cell.ratingLabel.text = gameArray[indexPath.row].rating
        
        if currentGame.checkedIn {
            cell.statusView.backgroundColor = UIColor.green
        } else {
            cell.statusView.backgroundColor = UIColor.red
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    gameArray[0].checkedIn = false
    }


}

