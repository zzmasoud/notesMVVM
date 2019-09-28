//
//  TagTableViewCell.swift
//  Notes
//
//  Created by Masoud Sheikh Hosseini on 9/18/19.
//  Copyright © 2019 Masoud Sheikh Hosseini. All rights reserved.
//

import UIKit

class TagTableViewCell: UITableViewCell {

    static let id = "tag_cell"
    static let height: CGFloat = 50
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: TagTableViewCellViewModel! {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        titleLabel.text = viewModel.title
        colorView.backgroundColor = viewModel.color
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        colorView.layer.cornerRadius = colorView.layer.bounds.size.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = selected ? .checkmark : .none
    }

}
