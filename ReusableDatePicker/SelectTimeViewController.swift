//
//  SelectTimeViewController.swift
//  ReusableDatePicker
//
//  Created by Santiago Cuervo - Ceiba Software on 3/10/18.
//  Copyright © 2018 Santiago Cuervo - Ceiba Software. All rights reserved.
//

import UIKit

class SelectTimeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectTime(_ sender: UIButton) {
        let sb = UIStoryboard(name: "DatePopupViewController", bundle: nil)
        let popup = sb.instantiateInitialViewController()! as! DatePopupViewController
        popup.showTimePicker = true
        present(popup, animated: true)
    }
    

}
