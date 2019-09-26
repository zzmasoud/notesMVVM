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
    
    var noteViewModel: NoteVCViewModel?
    
    init() {}
    
    init(noteViewModel: NoteVCViewModel) {
        self.noteViewModel = noteViewModel
    }
    
    var allowSelection: Bool {
        return noteViewModel != nil
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    var numberOfRows: Int {
        return tags.count
    }
    
    func tag(for index: Int) -> TagTableViewCellViewModel {
        return TagTableViewCellViewModel(model: tags[index], selected: noteViewModel?.isTagged(tag: tags[index]) ?? false)
    }
    
    
    mutating func didSelect(index: Int) {
        noteViewModel?.add(tag: tags[index])
    }
    
    mutating func didDeSelect(index: Int) {
        noteViewModel?.remove(tag: tags[index])
    }
}
