//
//  SecondViewController.swift
//  ReusableDatePicker
//
//  Created by Santiago Cuervo - Ceiba Software on 3/10/18.
//  Copyright © 2018 Santiago Cuervo - Ceiba Software. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    
    var observer: NSObjectProtocol?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //        Notifications: NEW WAY
        observer = NotificationCenter.default.addObserver(forName: .saveDateTime, object: nil, queue: OperationQueue.main) { (notification) in
            let dateVc = notification.object as! DatePopupViewController
            self.dateLabel.text = dateVc.formattedDate
        }
    }
    
//    We need to remove always the Observer to not generate Memory Leaks
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
}

