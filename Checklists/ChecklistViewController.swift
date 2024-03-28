//
//  ViewController.swift
//  Checklists
//
//  Created by Thomas Neylon on 3/28/24.
//

import UIKit

class ChecklistViewController: UITableViewController {
    var items = [ChecklistItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let item1 = ChecklistItem()
        item1.text = "Walk the dog"
        items.append(item1)
        
        let item2 = ChecklistItem()
        item2.text = "Brush my teeth"
        item2.checked = true
        items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "Learn iOS development"
        item3.checked = true
        items.append(item3)
        
        let item4 = ChecklistItem()
        item4.text = "Soccer practice"
        items.append(item4)
        
        let item5 = ChecklistItem()
        item5.text = "Eat ice cream"
        item5.checked = true
        items.append(item5)
        
    }
    
    //MARK: - Table View Data Source
    // this lets the table view know how many rows of data there are by returning the int
    override func tableView(
        _ tableView: UITableView,          // parameter 1
        numberOfRowsInSection section: Int // parameter 2
    ) -> Int {                             // return value
        return items.count
    }
    
    //this it seems to communicate with the table view to apply data to a cell i think
    override func tableView(
        _ tableView: UITableView,           // parameter 1
        cellForRowAt indexPath: IndexPath   // parameter 2
    ) -> UITableViewCell {                  // return value
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ChecklistItem",
            for: indexPath)
        
        let item = items[indexPath.row]
        
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        
        return cell
    }
    
    //ask joe about for at indexPath: IndexPath  and for with which is whjat it is now
    func configureCheckmark(
        for cell: UITableViewCell,
        with item: ChecklistItem
    ) {
        
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    func configureText(
        for cell: UITableViewCell,
        with item: ChecklistItem
    ){
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    //MARK: - Table View Delegate
    override func tableView(
        _ tableView: UITableView,             // parameter 1
        didSelectRowAt indexPath: IndexPath   // parameter 2
    ){
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.checked.toggle()
            
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
    

