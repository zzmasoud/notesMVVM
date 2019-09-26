//
//  Note.swift
//  Notes
//
//  Created by Masoud Sheikh Hosseini on 9/17/19.
//  Copyright © 2019 Masoud Sheikh Hosseini. All rights reserved.
//

import Foundation

class Note: NSObject, NSCoding {
    
    let createdAt: Date
    var updatedAt: Date
    var text: String {
        didSet {
            updatedAt = Date()
        }
    }
    var _tags:[Int]? {
        didSet {
            updatedAt = Date()
        }
    }
    
    var tags:[Tag]? {
        let _all:[Tag]? = [
            Tag(id: 1, title: "Work", colorHex: "#CF5E26"),
            Tag(id: 2, title: "Home", colorHex: "#4894F5"),
            Tag(id: 3, title: "Personal", colorHex: "#E06A7B")
        ]
        guard let ids = _tags , let all = _all else {
            return nil
        }
        
        var results:[Tag]?
        for id in ids {
            for each in all {
                if id == each.id {
                    if results?.append(each) == nil {
                        results = [each]
                    }
                }
            }
        }
        return results
    }
    
    
    
    init(text: String) {
        self.text = text
        self.createdAt = Date()
        self.updatedAt = Date()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(text, forKey: "text")
        coder.encode(createdAt, forKey: "created_at")
        coder.encode(updatedAt, forKey: "updated_at")
        coder.encode(_tags, forKey: "tags")
    }
    
    required init?(coder: NSCoder) {
        text = coder.decodeObject(forKey: "text") as! String
        createdAt = coder.decodeObject(forKey: "created_at") as! Date
        updatedAt = coder.decodeObject(forKey: "updated_at") as! Date
        _tags = coder.decodeObject(forKey: "tags") as? [Int]
    }
    
    func add(tag: Tag) {
        if self._tags?.append(tag.id) == nil {
            self._tags = [tag.id]
        }
    }
    
    func remove(tag: Tag) {
        for i in 0..<_tags!.count {
            if _tags![i] == tag.id {
                _tags?.remove(at: i)
                return
            }
        }
    }

}
