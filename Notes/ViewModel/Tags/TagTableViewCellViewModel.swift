//
//  TagTableViewCellViewModel.swift
//  Notes
//
//  Created by Masoud Sheikh Hosseini on 9/19/19.
//  Copyright © 2019 Masoud Sheikh Hosseini. All rights reserved.
//

import UIKit

struct TagTableViewCellViewModel {
    private let model: Tag
    private var selected: Bool
    
    init(model: Tag, selected: Bool) {
        self.model = model
        self.selected = selected
    }

    var color: UIColor {
        return UIColor.init(hexString: model.colorHex)
    }
    var title: String {
        return model.title
    }
    var accessoryType: UITableViewCell.AccessoryType {
        return selected ? .checkmark : .none
    }
}
