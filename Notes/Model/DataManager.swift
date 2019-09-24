//
//  DataManager.swift
//  Notes
//
//  Created by Masoud Sheikh Hosseini on 9/18/19.
//  Copyright © 2019 Masoud Sheikh Hosseini. All rights reserved.
//

import Foundation

class DataManager {
    
    static var notes: [Note] = []
    static func loadNotes() -> [Note] {
        
        guard let data = UserDefaults.standard.data(forKey: "notes") , let cachedItems = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Note] else {
            var notes:[Note] = []
            for i in 0...5 {
                notes.append(Note(text: "note\(i)"))
            }
            self.notes = notes
            return DataManager.notes
        }
        self.notes = cachedItems
        return cachedItems
    }
    
    static func save() {
        let newEncodedData = NSKeyedArchiver.archivedData(withRootObject: DataManager.notes)
        UserDefaults.standard.set(newEncodedData, forKey: "notes")
        UserDefaults.standard.synchronize()
    }
}
