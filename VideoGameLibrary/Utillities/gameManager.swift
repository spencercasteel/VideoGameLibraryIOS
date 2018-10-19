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
    
    private var gameArray = [Game(title: "Halo 2", genre: "shooter", description: "Halo 2 is a 2004 first-person shooter video game developed by Bungie. Released for the Xbox video game console on November 9, 2004, the game is the second installment in the Halo franchise and the sequel to 2001's critically acclaimed Halo: Combat Evolved. ", rating: "M"), Game(title: "Portal 2", genre: "Puzzle", description: "Portal 2 is a first-person puzzle-platform video game developed by Valve Corporation. It was released in April 2011 for Windows, OS X, Linux, PlayStation 3, and Xbox 360. The digital PC version is distributed online by Valve's Steam service, while all retail editions were published by Electronic Arts.", rating: "M")]
    
    func getGameCount() -> Int {
        return gameArray.count
    }
    
    func getGame(at index: Int) -> Game {
        return gameArray[index]
    }
    
    func addGame(game: Game) {
        gameArray.append(game)
    }
    
    func removeGame(at index: Int) {
        gameArray.remove(at: index)
    }
    
    func checkGameInOrOut(at index: Int) {
        let gameForIndex = gameArray[index]
        gameArray[index].checkedIn = !gameArray[index].checkedIn
        
        if gameForIndex.checkedIn {
            gameForIndex.dueDate = nil
        } else {
            gameForIndex.dueDate = Calendar.current.date(byAdding: .day, value: 14, to: Date())
        }
    }
}
