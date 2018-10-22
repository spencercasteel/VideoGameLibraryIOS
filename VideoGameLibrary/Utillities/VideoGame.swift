//
//  VideoGame.swift
//  VideoGameLibrary
//
//  Created by Spencer Casteel on 10/16/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import Foundation
import RealmSwift

class Game: Object {
    @objc dynamic var dueDate: Date? = nil
    @objc dynamic var title: String = ""
    @objc dynamic var genre: String = ""
    @objc dynamic var gameDescription: String = ""
    @objc dynamic var checkedIn: Bool = true
    @objc dynamic var rating: String = ""
    

}
