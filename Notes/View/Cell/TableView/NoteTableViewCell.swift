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
    @IBOutlet weak var tagsStackView: UIStackView!
    
    var viewModel: NoteVCViewModel! {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        titleLabel.text = viewModel.text
        dateLabel.text = viewModel.updateStamp
        reArrangeTagsStackView()
    }
    
    private func reArrangeTagsStackView() {
        let removedSubviews = tagsStackView.arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            tagsStackView.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        removedSubviews.forEach({ $0.removeFromSuperview() })
        
        for index in 0..<viewModel.numberOfTags {
            let view = UIView()
            view.backgroundColor = viewModel.tag(for: index).color
            tagsStackView.addArrangedSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            let heightConstraint = NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: tagsStackView, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 0)
            let widthConstraint = NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 0)
            NSLayoutConstraint.activate([heightConstraint,widthConstraint])
            
            view.layoutIfNeeded()
            view.layer.cornerRadius = view.bounds.width/2

        }
        
        tagsStackView.spacing = -10
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
