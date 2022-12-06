//
//  StatisticsViewController.swift
//  Money tracker
//
//  Created by Yuliya Lapenak on 10/24/22.
//

import UIKit
import AAInfographics

class StatisticsViewController: UIViewController {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var startTextField: UITextField!
    @IBOutlet weak var endTextField: UITextField!
    @IBOutlet weak var periodDateLabel: UILabel!
    @IBOutlet weak var calculateButtonPressed: UIButton!
    
    let realmManager = RealmManager()
    
    private lazy var startDatePicker: UIDatePicker = {
        let startDatePicker = UIDatePicker(frame: .zero)
        startDatePicker.datePickerMode = .date
        startDatePicker.timeZone = TimeZone.current
        return startDatePicker
    }()
    
    private lazy var endDatePicker: UIDatePicker = {
        let endDatePicker = UIDatePicker(frame: .zero)
        endDatePicker.datePickerMode = .date
        endDatePicker.timeZone = TimeZone.current
        return endDatePicker
    }()
    
    var startDate: Date?
    var endDate: Date?
    let calculateManager = CalculateManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateGlobalPrice()
    }
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        getPriceForPeriod()
    }
    
    func setup(){
        startTextField.inputView = startDatePicker
        endTextField.inputView = endDatePicker
        startDatePicker.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
        endDatePicker.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
        if #available(iOS 14, *) {
            startDatePicker.preferredDatePickerStyle = .wheels
            endDatePicker.preferredDatePickerStyle = .wheels
        }
    }
    
    @objc func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        if sender == startDatePicker {
            startTextField.text = dateFormatter.string(from: sender.date)
            startDate = sender.date
        } else {
            endTextField.text = dateFormatter.string(from: sender.date)
            endDate = sender.date
        }
    }
    
    func calculateGlobalPrice() {
        let sum = calculateManager.calculateGlobalPrice()
        priceLabel.text = String(sum) + "$"
    }
    
    func getPriceForPeriod() {
        guard let startDate = startDate ,
        let endDate = endDate else {
            return
        }
        let sum = calculateManager.calculateTotalForPeriod(startDate: startDate, endDate: endDate)
        priceLabel.text = sum == 0 ? "No expenses" : String(sum) + "$"
    }
    
    @IBAction func screenTap(_ sender: Any) {
        view.endEditing(true)
    }
}
