//
//  gameManager.swift
//  VideoGameLibrary
//
//  Created by Spencer Casteel on 10/17/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import Foundation

class GameManager{
    static let sharedInstance = GameManager()
    
    private init() {
    }
    
    private var gameArray = [Game(title: "Halo 2", genre: "shooter", description: "", rating: "M"), Game(title: "Portal 2", genre: "Puzzle", description: "", rating: "M")]
    
    func getGameCount() -> Int {
        return gameArray.count
    }
    
    func getGame(at index: Int) -> Game {
        return gameArray[index]
    }
}
