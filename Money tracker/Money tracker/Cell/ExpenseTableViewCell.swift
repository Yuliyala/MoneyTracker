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
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(expense: Expense) {
        
        titleLabel.text = expense.name
        priceLabel.text = String(expense.price)

        var time = Date()
        var formatter = DateFormatter()
        formatter.dateFormat = "MMM d yyyy"
        let formattedDateInString = formatter.string(from: expense.date)
        dateLabel.text = formattedDateInString
//        categoryLabel.text = expense.category
    }
}
