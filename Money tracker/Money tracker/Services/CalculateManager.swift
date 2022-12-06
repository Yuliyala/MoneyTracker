//
//  CalculateManager.swift
//  Money tracker
//
//  Created by Yuliya Lapenak on 10/31/22.
//

import Foundation


class CalculateManager {
    
    let realmManager = RealmManager()
    
    func calculateTotalForPeriod(startDate: Date, endDate: Date) -> Double {
        let filtered = realmManager.getExpenses().filter { expense in
            return  expense.date > startDate && expense.date < endDate
        }
        return calculatePriceFor(expenses: filtered)
    }
    
    func calculateGlobalPrice() -> Double {
        let filtered = realmManager.getExpenses()
        return calculatePriceFor(expenses: filtered)
    }
    
    private func calculatePriceFor(expenses: [Expense]) -> Double {
        let prices = expenses.map { expense in
            return expense.price
        }
        return prices.reduce( 0, +)
    }
    
}
