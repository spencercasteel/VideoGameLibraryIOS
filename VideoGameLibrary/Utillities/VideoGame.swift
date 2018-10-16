//
//  VideoGame.swift
//  VideoGameLibrary
//
//  Created by Spencer Casteel on 10/16/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import Foundation

class VideoGame {
    let dueDate: Bool
    let title: String
    let genre: String
    let description: String
    let checkedIn: Bool
    let rating: String
    
    init(dueDate: Bool, title: String, genre: String, description: String, checkedIn: Bool, rating: String) {
        self.dueDate = dueDate
        self.title = title
        self.genre = genre
        self.description = description
        self.checkedIn = checkedIn
        self.rating = rating
    }
}
