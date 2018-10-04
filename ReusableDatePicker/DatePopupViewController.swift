//
//  DatePopupViewController.swift
//  ReusableDatePicker
//
//  Created by Santiago Cuervo - Ceiba Software on 3/10/18.
//  Copyright © 2018 Santiago Cuervo - Ceiba Software. All rights reserved.
//

import UIKit

class DatePopupViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    
    var showTimePicker: Bool = false
    
    var formattedDate: String {
        let formatted = DateFormatter()
        formatted.dateStyle = .medium
        return formatted.string(from: datePicker.date)
    }
    
    var formattedTime: String {
        get {
            let formatted = DateFormatter()
            formatted.timeStyle = .short
            return formatted.string(from: datePicker.date)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if showTimePicker {
            titleLabel.text = "Select Time"
            datePicker.datePickerMode = .time
            saveButton.setTitle("Save Time", for: .normal)
        }
    }
    
    @IBAction func saveDate(_ sender: UIButton) {
        NotificationCenter.default.post(name: .saveDateTime, object: self)
        
        dismiss(animated: true)
    }
    
}
