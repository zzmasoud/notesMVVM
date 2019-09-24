//
//  TagCollectionViewViewModel.swift
//  Notes
//
//  Created by Masoud Sheikh Hosseini on 9/19/19.
//  Copyright © 2019 Masoud Sheikh Hosseini. All rights reserved.
//

import Foundation
import UIKit

struct TagCollectionViewViewModel {
    let model: Tag
    
    var title: String {
        return model.title
    }
    
    var color: UIColor {
        return UIColor(hexString: model.colorHex)
    }
}
