//
//  TagsTVCViewModel.swift
//  Notes
//
//  Created by Masoud Sheikh Hosseini on 9/19/19.
//  Copyright © 2019 Masoud Sheikh Hosseini. All rights reserved.
//

import Foundation

struct TagsTVCViewModel {
    private let tags: [Tag] = [
        Tag(id: 1, title: "Work", colorHex: "#CF5E26"),
        Tag(id: 2, title: "Home", colorHex: "#4894F5"),
        Tag(id: 3, title: "Personal", colorHex: "#E06A7B")
    ]
    
    init() {
        
    }
    
    init(noteViewModel: NoteVCViewModel) {
        
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    var numberOfRows: Int {
        return tags.count
    }
    
    func tag(for index: Int) -> TagTableViewCellViewModel {
        return Tag(id: 2, title: "ddd", colorHex: "EEE")
    }
}
