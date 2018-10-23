//
//  gameManager.swift
//  VideoGameLibrary
//
//  Created by Spencer Casteel on 10/17/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import Foundation
import RealmSwift

class GameManager{
    static let sharedInstance = GameManager()
    
    private init() {
        gameArray = realm.objects(Game.self)
    }
    //Results container for storing games. this function very similary to an array or dictionary
    private var gameArray: Results<Game>!
    
    //referance to the local realm database
    let realm = try! Realm()
    
    //function to get the number of games we have
    func getGameCount() -> Int {
        return gameArray.count
    }
    
    //function to get a game at a specific index
    func getGame(at index: Int) -> Game {
        return gameArray[index]
    }
    
    //function to add a game to the game library
    func addGame(game: Game) {
        try! realm.write {
            realm.add(game)
        }
    }
    
    //function to remove a game from a library
    func removeGame(at index: Int) {
        try! realm.write {
            realm.delete(getGame(at: index))
        }
    }
    
    //function to check in or out a game
    func checkGameInOrOut(at index: Int) {
        let gameForIndex = gameArray[index]
        try! realm.write {
            gameForIndex.checkedIn = !gameForIndex.checkedIn
            
            if gameForIndex.checkedIn {
                gameForIndex.dueDate = nil
            } else {
                gameForIndex.dueDate = Calendar.current.date(byAdding: .day, value: 14, to: Date())
            }
        }
    }
}
