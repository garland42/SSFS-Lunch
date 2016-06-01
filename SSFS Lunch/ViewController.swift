//
//  ViewController.swift
//  SSFS Lunch
//
//  Created by Claire Youmans on 4/25/16.
//  Copyright © 2016 Claire Youmans. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var menu = Menu()
    
    @IBOutlet weak var dayPicker: UIPickerView!
    var weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    
    let monday = DailyMenu(regExText: "MONDAY(.*?)TUESDAY", isFriday: false)
    let tuesday = DailyMenu(regExText: "TUESDAY(.*?)WEDNESDAY", isFriday: false)
    let wednesday = DailyMenu(regExText: "WEDNESDAY(.*?)THURSDAY", isFriday: false)
    let thursday = DailyMenu(regExText: "THURSDAY(.*?)FRIDAY", isFriday: false)
    let friday = DailyMenu(regExText: "FRIDAY(.*)", isFriday: true)
    
    //lunchlabel.text = monday.lunchEntree
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1 //number of columns in the picker view
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weekdays.count //better way to do this bc it won't crash like it would if the #'s were different.
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return weekdays[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dayPicker.delegate = self
        self.dayPicker.dataSource = self
        let defaultPickerRow = dayPicker.numberOfRowsInComponent(0) / 2 //gives you half the # of rows
        dayPicker.selectRow(defaultPickerRow, inComponent: 0, animated: false)
        // Do any additional setup after loading the view, typically from a nib.
        print(friday.lunchEntree)
        print(friday.vegetarianEntree)
        print(friday.sides)
        print(friday.souperSoups)
        print(friday.downtownDeli)
//        print(friday.dayMeal)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

