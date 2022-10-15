//
//  ExpenseTableViewCell.swift
//  Money tracker
//
//  Created by Yuliya Lapenak on 10/14/22.
//

import UIKit

class ExpenseTableViewCell: UITableViewCell {
    
    static let identifier = "ExpenseTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(expense: Expense) {
        titleLabel.text = expense.name
//        priceLabel.text = expense.price
//        dateLabel.text = expense.date
    }
}
