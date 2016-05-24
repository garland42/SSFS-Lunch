//
//  Days.swift
//  SSFS Lunch
//
//  Created by Claire Youmans on 5/12/16.
//  Copyright © 2016 Claire Youmans. All rights reserved.
//

import UIKit
class Days: NSObject, UIPickerViewDataSource {
    var weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1 //number of columns in the picker view
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weekdays.count //better way to do this bc it won't crash like it would if the #'s were different.
    }
}