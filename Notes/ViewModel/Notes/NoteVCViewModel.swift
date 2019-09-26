//
//  NoteVCViewModel.swift
//  Notes
//
//  Created by Masoud Sheikh Hosseini on 9/17/19.
//  Copyright © 2019 Masoud Sheikh Hosseini. All rights reserved.
//

import UIKit

protocol NoteVCViewModelDelegate {
    func tagsChanged()
}

class NoteVCViewModel {
    let model: Note
    
    private var tags:[Tag] = []
    let formatter = DateFormatter()
    var delegate: NoteVCViewModelDelegate?
    
    
    init(model: Note) {
        self.model = model
        self.tags = model.tags ?? []
    }
    
    var text: String {
        return model.text
    }
    
    var createStamp: String {
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: model.createdAt)
    }
    
    var updateStamp: String {
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: model.updatedAt)
    }
    
    func update(text: String) {
        model.text = text
        model._tags = nil
        _ = tags.map({model.add(tag: $0)})
        DataManager.save()
    }
    
    func add(tag: Tag) {
        tags.append(tag)
        delegate?.tagsChanged()
    }
    
    func remove(tag: Tag) {
        for i in 0..<tags.count {
            if tags[i].id == tag.id {
                tags.remove(at: i)
                delegate?.tagsChanged()
                return
            }
        }
    }
    
    
    var numberOfTags: Int {
        return tags.count
    }
    
    func tag(for index: Int) -> TagCollectionViewViewModel {
        return TagCollectionViewViewModel(model: tags[index])
    }
    
    func tagWidth(for index: Int) -> CGSize {
        return tags[index].title.size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)])
    }
    
    func isTagged(tag: Tag) -> Bool {
        return tags.filter({$0.id == tag.id}).first != nil
    }
    
}
