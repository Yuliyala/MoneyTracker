//
//  AddRecordViewController.swift
//  Money tracker
//
//  Created by Yuliya Lapenak on 10/10/22.
//

import UIKit

class AddRecordViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var priceTextFirld: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var categorySegment: UISegmentedControl!
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.datePickerMode = .date
        datePicker.timeZone = TimeZone.current
        return datePicker
    }()
    
    private var selectedDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    func setup(){
        priceTextFirld.keyboardType = .decimalPad
        dateTextField.inputView = datePicker
        datePicker.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
        if #available(iOS 14, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
    }
    @objc func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        dateTextField.text = dateFormatter.string(from: sender.date)
        selectedDate = sender.date
    }
    
    @IBAction func addButtonPressed() {
        guard let title = titleTextField.text,
              !title.isEmpty,
              let priceString = priceTextFirld.text,
              let date = selectedDate,
              let price = Double(priceString) else {
            return
        }
        let category = getCategory()
        let expense = Expense(name: title, price: price, date: date, category: category)
    }
    
    private func getCategory() -> ExpenseCategory {
        switch categorySegment.selectedSegmentIndex {
        case 0:
            return .food
        case 1:
            return .house
        case 2:
            return .car
        default:
            return .food
        }
    }
    
}
