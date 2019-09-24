//
//  TagCompactCollectionViewCell.swift
//  Notes
//
//  Created by Masoud Sheikh Hosseini on 9/18/19.
//  Copyright © 2019 Masoud Sheikh Hosseini. All rights reserved.
//

import UIKit

class TagCompactCollectionViewCell: UICollectionViewCell {
    
    static let id = "tag_c_cell"
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    var model: Tag! {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        colorView.backgroundColor = UIColor(hexString: model.colorHex)
        titleLabel.text = model.title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        colorView.layer.cornerRadius = colorView.bounds.height/2
    }
}
