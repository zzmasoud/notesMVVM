//
//  NotesTVCViewModel.swift
//  Notes
//
//  Created by Masoud Sheikh Hosseini on 9/18/19.
//  Copyright © 2019 Masoud Sheikh Hosseini. All rights reserved.
//

import Foundation

struct NotesTVCViewModel {
    private(set) var notes = DataManager.loadNotes()
    
    var numberOfSections: Int {
        return 1
    }
    
    var numberOfRows: Int {
        return notes.count
    }
    
    func note(for index: Int) -> NoteVCViewModel {
        return NoteVCViewModel(model: notes[index])
    }
    
    mutating func reloadData() {
        notes = DataManager.loadNotes()
    }
    
    mutating func remove(at index: Int) {
        notes.remove(at: index)
        DataManager.save()
    }
}
