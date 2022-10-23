//
//  RealmManager.swift
//  Money tracker
//
//  Created by Yuliya Lapenak on 10/17/22.
//

import Foundation
import RealmSwift

class RealmManager {
    
    private let realm = try! Realm()
    
    func saveExpense(name: String, price: Double, date: Date, category: ExpenseCategory) {
        let expense = ExpenseRealmModel.create(name: name, price: price, date: date, category: category)
        try! realm.write({
            realm.add(expense)
        })
    }
    
    func getExpenses() -> [Expense] {
        let expenses = realm.objects(ExpenseRealmModel.self) // получаем из базы данных все объекты данного типа
        var result = [Expense]()
        for expense in expenses {
            let model = Expense(model: expense)
            result.append(model)
        }
        return result
    }
    
    func deleteExpense(id: String) {
      
        guard let key = try?  ObjectId(string: id),
              let expense = realm.object(ofType: ExpenseRealmModel.self, forPrimaryKey: key) else {return}
        try! realm.write({
            realm.delete(expense)
        })

    }
}
