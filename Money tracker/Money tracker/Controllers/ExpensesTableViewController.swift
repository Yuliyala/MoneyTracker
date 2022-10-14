//
//  ViewController.swift
//  Money tracker
//
//  Created by Yuliya Lapenak on 10/10/22.
//

import UIKit

class ExpensesTableViewController: UIViewController {
    
    private var dataSource = [Expense]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destination = storyboard.instantiateViewController(withIdentifier: "AddRecordViewController") as? AddRecordViewController else {return}
        navigationController?.pushViewController(destination, animated: true)
        
    }
    
    
}

