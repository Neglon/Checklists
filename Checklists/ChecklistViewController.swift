//
//  ViewController.swift
//  Checklists
//
//  Created by Thomas Neylon on 3/28/24.
//

import UIKit

class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //MARK: - Table View Data Source
    // this lets the table view know how many rows of data there are by returning the int
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 5
    }
    //this it seems to communicate with the table view to apply data to a cell i think
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row == 0 {
            label.text = "Walk the dog"
        } else if indexPath.row == 1 {
            label.text = "Brush my teeth"
        } else if indexPath.row == 2 {
            label.text = "Learn iOS development"
        } else if indexPath.row == 3 {
            label.text = "Soccer Practice"
        } else if indexPath.row == 4 {
            label.text = "Eat Ice Cream"
        }
        
        return cell
    }

}

