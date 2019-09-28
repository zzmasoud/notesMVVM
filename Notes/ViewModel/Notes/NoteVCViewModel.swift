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
    private var model: Note?
    private var tags:[Tag] = []
    
    lazy var formatter: DateFormatter = {
        return DateFormatter()
    }()
    var delegate: NoteVCViewModelDelegate?
    
    init(model: Note?) {
        self.model = model
        self.tags = model?.tags ?? []
    }
    
    var text: String {
        return model?.text ?? ""
    }
    
    var createStamp: String {
        guard let createdAt = model?.createdAt else {
            return "-"
        }
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: createdAt)
    }
    
    var updateStamp: String {
        guard let updatedAt = model?.updatedAt else {
            return "-"
        }
        formatter.dateStyle = updatedAt.distance(to: Date()) < 86400 ? .none : .short
        formatter.timeStyle = .short
        return formatter.string(from: updatedAt)
    }
    
    func save(text: String) {
        if let model = self.model {
            model.text = text
            model.update(tags: tags)
            DataManager.shared.save()
        } else {
            model = Note(text: text)
            model?.update(tags: tags)
            DataManager.shared.add(note: model!)
        }
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
    
    // MARK: - CollectionView
    
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
