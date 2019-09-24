//
//  NoteTableViewCell.swift
//  Notes
//
//  Created by Masoud Sheikh Hosseini on 9/17/19.
//  Copyright © 2019 Masoud Sheikh Hosseini. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    static let id = "note_cell"
    static let height: CGFloat = 100
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var viewModel: NoteVCViewModel! {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        titleLabel.text = viewModel.text
        dateLabel.text = viewModel.updateStamp
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
