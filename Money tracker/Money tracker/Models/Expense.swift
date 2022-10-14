//
//  Expense.swift
//  Money tracker
//
//  Created by Yuliya Lapenak on 10/10/22.
//

import UIKit

enum ExpenseCategory {
    case food
    case house
    case car
}

struct Expense {
    let name: String
    let price: Double
    let date: Date
    let category: ExpenseCategory
}
