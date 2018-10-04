//
//  FirstViewController.swift
//  ReusableDatePicker
//
//  Created by Santiago Cuervo - Ceiba Software on 3/10/18.
//  Copyright © 2018 Santiago Cuervo - Ceiba Software. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //        Notifications: OLD WAY
        NotificationCenter.default.addObserver(self, selector: #selector(handlePopupClosing), name: .saveDateTime, object: nil)
    }
    
//    We need to remove always the Observer to not generate Memory Leaks
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func handlePopupClosing(notification: Notification) {
        let dateVc = notification.object as! DatePopupViewController
        dateLabel.text = dateVc.formattedDate
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDatePopupViewControllerSegue" {
            let popup = segue.destination as! DatePopupViewController
            popup.showTimePicker = false
        }
    }

}

