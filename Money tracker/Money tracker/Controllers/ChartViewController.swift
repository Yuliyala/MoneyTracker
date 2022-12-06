//
//  ChartViewController.swift
//  Money tracker
//
//  Created by Yuliya Lapenak on 10/24/22.
//

import UIKit
import AAInfographics

class ChartViewController: UIViewController {
    
    let realmManager =  RealmManager()
    
    @IBOutlet weak var chartView: AAChartView!
    @IBOutlet weak var startTextField: UITextField!
    @IBOutlet weak var endTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        let aaChartModel = AAChartModel()
            .chartType(.column)//Can be any of the chart types listed under `AAChartType`.
            .animationType(.bounce)
            .title("TITLE")//The chart title
            .subtitle("subtitle")//The chart subtitle
            .dataLabelsEnabled(false) //Enable or disable the data labels. Defaults to false
            .tooltipValueSuffix("USD")//the value suffix of the chart tooltip
            .categories(["Food", "Car", "House"])
            .series([
                AASeriesElement()
                    .data([getExpensesForCategory(category: .food),
                           getExpensesForCategory(category: .car),
                           getExpensesForCategory(category: .house)]),
            ])
        chartView.aa_drawChartWithChartModel(aaChartModel)
    }
    
    func getExpensesForCategory(category: ExpenseCategory) -> Double {
        let filtered = realmManager.getExpenses().filter { expense in
            expense.category == category
        }
        let prices = filtered.map { expense in
            expense.price
        }
        return prices.reduce( 0, + )
    }
}
