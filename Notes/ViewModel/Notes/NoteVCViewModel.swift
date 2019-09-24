//
//  NoteVCViewModel.swift
//  Notes
//
//  Created by Masoud Sheikh Hosseini on 9/17/19.
//  Copyright © 2019 Masoud Sheikh Hosseini. All rights reserved.
//

import Foundation

struct NoteVCViewModel {
    let model: Note
    
    let formatter = DateFormatter()
    
    var text: String {
        return model.text
    }
    
    var createStamp: String {
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: model.createdAt)
    }
    
    var updateStamp: String {
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: model.updatedAt)
    }
    
    func update(text: String) {
        model.text = text
        DataManager.save()
    }
    
    func update(tags: [Int]?) {
        
    }
    
    
    var numberOfTags: Int {
        return model._tags?.count ?? 0
    }
    
    func tag(for Index: Int) -> TagCollectionViewViewModel {
        return TagCollectionViewViewModel(model: model.tags![Index])
    }
    
}
