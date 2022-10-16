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
        setupTable()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destination = storyboard.instantiateViewController(withIdentifier: "AddRecordViewController") as? AddRecordViewController else {return}
        destination.delegate = self
        navigationController?.pushViewController(destination, animated: true)
        
    }
    
    func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ExpenseTableViewCell", bundle: nil), forCellReuseIdentifier: ExpenseTableViewCell.identifier)
        tableView.rowHeight = 80
    }
    
}

extension ExpensesTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExpenseTableViewCell.identifier, for: indexPath) as? ExpenseTableViewCell else {
            return UITableViewCell()
        }
        cell.setup(expense: dataSource[indexPath.row])
        return cell
    }
}

extension ExpensesTableViewController: UITableViewDelegate {
    
}

extension ExpensesTableViewController: AddRecordViewControllerDelegate {
    func addExpense(expense: Expense) {
        dataSource.append(expense)
        tableView.reloadData()
    }
}
