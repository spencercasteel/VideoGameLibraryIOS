//
//  VideoGame.swift
//  VideoGameLibrary
//
//  Created by Spencer Casteel on 10/16/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import Foundation

class VideoGame {
    var dueDate: Date?
    var title: String
    var genre: String
    var description: String
    var checkedIn: Bool = true
    var rating: String
    
    init(title: String, genre: String, description: String, rating: String) {
        self.title = title
        self.genre = genre
        self.description = description
        self.rating = rating
    }
}
