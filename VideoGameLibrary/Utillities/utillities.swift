//
//  utillities.swift
//  VideoGameLibrary
//
//  Created by Spencer Casteel on 10/18/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import Foundation

func formatDate(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    
    dateFormatter.dateFormat = "MMM d, yyyy"
    
    let formattedString = dateFormatter.string(from: date)
    
    return formattedString
}
