//
//  NotesTableViewController.swift
//  Notes
//
//  Created by Masoud Sheikh Hosseini on 9/17/19.
//  Copyright © 2019 Masoud Sheikh Hosseini. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {

    var viewModel = NotesTVCViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.reloadData()
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.id, for: indexPath) as! NoteTableViewCell
        cell.viewModel = viewModel.note(for: indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return NoteTableViewCell.height
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sender = viewModel.note(for: indexPath.row)
        self.performSegue(withIdentifier: "show_note", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? NoteViewController {
            vc.viewModel = (segue.identifier == "show_note") ? sender as? NoteVCViewModel : NoteVCViewModel(model: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            viewModel.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        default:
            break
        }
    }
    
}
