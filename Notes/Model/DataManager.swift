//
//  DataManager.swift
//  Notes
//
//  Created by Masoud Sheikh Hosseini on 9/18/19.
//  Copyright © 2019 Masoud Sheikh Hosseini. All rights reserved.
//

import Foundation

class DataManager {
    private(set) var notes:[Note]
    
    static let shared = DataManager()
    
    private init() {
        guard let data = UserDefaults.standard.data(forKey: "notes") , let cachedItems = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Note] else {
                self.notes = []
                return
            }
        self.notes = cachedItems.sorted(by: {$0.updatedAt > $1.updatedAt})
    }

    func save() {
        let newEncodedData = NSKeyedArchiver.archivedData(withRootObject: notes)
        UserDefaults.standard.set(newEncodedData, forKey: "notes")
        UserDefaults.standard.synchronize()
    }
    
    func add(note: Note) {
        self.notes.insert(note, at: 0)
        self.save()
    }
    
    func remove(at index: Int) {
        self.notes.remove(at: index)
        self.save()
    }

}
