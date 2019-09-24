//
//  Tag.swift
//  Notes
//
//  Created by Masoud Sheikh Hosseini on 9/18/19.
//  Copyright © 2019 Masoud Sheikh Hosseini. All rights reserved.
//

import Foundation

class Tag: NSObject {
    let id: Int
    var title: String
    var colorHex: String
    
    init(id: Int, title: String, colorHex: String) {
        self.id = id
        self.title = title
        self.colorHex = colorHex
    }
}
