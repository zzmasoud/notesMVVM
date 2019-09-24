//
//  NoteViewController.swift
//  Notes
//
//  Created by Masoud Sheikh Hosseini on 9/17/19.
//  Copyright © 2019 Masoud Sheikh Hosseini. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    let tags:[Tag] = [
        Tag(id: 1, title: "Work", colorHex: "#CF5E26"),
        Tag(id: 2, title: "Home", colorHex: "#4894F5"),
        Tag(id: 3, title: "Personal", colorHex: "#E06A7B")
    ]

    
    @IBOutlet weak var createDateLabel: UILabel!
    @IBOutlet weak var updateDateLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func saveTapped() {
        guard !textView.text.isEmpty else {
            return
        }
        viewModel?.update(text: textView.text)
        navigationController?.popViewController(animated: true)
    }
    
    var viewModel: NoteVCViewModel? {
        didSet {
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func updateUI() {
        loadViewIfNeeded()
        createDateLabel.text = viewModel?.createStamp
        updateDateLabel.text = viewModel?.updateStamp
        
        textView.text = viewModel?.text
    }
    
}


extension NoteViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCompactCollectionViewCell.id, for: indexPath) as! TagCompactCollectionViewCell
        cell.model = tags[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return tags[indexPath.row].title.size(withAttributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)
        ])
    }
    
}
