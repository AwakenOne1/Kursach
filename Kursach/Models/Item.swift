//
//  Item.swift
//  Kursach
//
//  Created by Alexey Dubovik on 4.05.24.
//

import Foundation

struct Item {
    let title: String
    let imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}
