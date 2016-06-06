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
    
    @IBOutlet weak var weekLabel: UILabel!
    
    @IBOutlet weak var lunchEntreeLabel: UILabel!
    
    @IBOutlet weak var vegetarianEntreeLabel: UILabel!
    
    @IBOutlet weak var sidesLabel: UILabel!
    
    @IBOutlet weak var souperSoupsLabel: UILabel!
    
    @IBOutlet weak var downtownDeliLabel: UILabel!
    
    
    let week = DailyMenu(regExText: "OF(.*?),", isFriday: false)
    let monday = DailyMenu(regExText: "MONDAY(.*?)TUESDAY", isFriday: false)
    let tuesday = DailyMenu(regExText: "TUESDAY(.*?)WEDNESDAY", isFriday: false)
    let wednesday = DailyMenu(regExText: "WEDNESDAY(.*?)THURSDAY", isFriday: false)
    let thursday = DailyMenu(regExText: "THURSDAY(.*?)FRIDAY", isFriday: false)
    let friday = DailyMenu(regExText: "FRIDAY(.*)", isFriday: true)
//    let userDefaultsLastRowKey = "defaultRow"
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1 //number of columns in the picker view
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weekdays.count //better way to do this bc it won't crash like it would if the #'s were different.
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return weekdays[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if weekdays[row] == "Monday" { //alright so I know this is a horrible way to do it but I just want to be able to do it at all before I make it neater. I am totally open to ideas. Also, I need to fix it so that the text doesn't disapear off of the screen, and so that it starts off saying something.
            lunchEntreeLabel.text = "Lunch Entrée: " + monday.lunchEntree
            vegetarianEntreeLabel.text = "Vegetarian Entrée: " + monday.vegetarianEntree
            sidesLabel.text = "Sides: " + monday.sides
            souperSoupsLabel.text = "Souper Soups: " + monday.souperSoups
            downtownDeliLabel.text = "Downtown Deli: " + monday.downtownDeli
        } else if weekdays[row] == "Tuesday" {
            lunchEntreeLabel.text = "Lunch Entrée: " + tuesday.lunchEntree
            vegetarianEntreeLabel.text = "Vegetarian Entrée: " + tuesday.vegetarianEntree
            sidesLabel.text = "Sides: " + tuesday.sides
            souperSoupsLabel.text = "Souper Soups: " + tuesday.souperSoups
            downtownDeliLabel.text = "Downtown Deli: " + tuesday.downtownDeli
        } else if weekdays[row] == "Wednesday" {
            lunchEntreeLabel.text = "Lunch Entrée: " + wednesday.lunchEntree
            vegetarianEntreeLabel.text = "Vegetarian Entrée: " + wednesday.vegetarianEntree
            sidesLabel.text = "Sides: " + wednesday.sides
            souperSoupsLabel.text = "Souper Soups: " + wednesday.souperSoups
            downtownDeliLabel.text = "Downtown Deli: " + wednesday.downtownDeli
        } else if weekdays[row] == "Thursday" {
            lunchEntreeLabel.text = "Lunch Entrée: " + thursday.lunchEntree
            vegetarianEntreeLabel.text = "Vegetarian Entrée: " + thursday.vegetarianEntree
            sidesLabel.text = "Sides: " + thursday.sides
            souperSoupsLabel.text = "Souper Soups: " + thursday.souperSoups
            downtownDeliLabel.text = "Downtown Deli: " + thursday.downtownDeli
        } else if weekdays[row] == "Friday" {
            lunchEntreeLabel.text = "Lunch Entrée: " + friday.lunchEntree
            vegetarianEntreeLabel.text = "Vegetarian Entrée: " + friday.vegetarianEntree
            sidesLabel.text = "Sides: " + friday.sides
            souperSoupsLabel.text = "Souper Soups: " + friday.souperSoups
            downtownDeliLabel.text = "Downtown Deli: " + friday.downtownDeli
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weekLabel.text = week.dayMeal

        self.dayPicker.delegate = self
        self.dayPicker.dataSource = self
        let defaultPickerRow = dayPicker.numberOfRowsInComponent(0) / 2 //gives you half the # of rows
        dayPicker.selectRow(defaultPickerRow, inComponent: 0, animated: false)
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func displayLunchOptionsForRow(row: Int) {
//        
//    }
//    
//    func saveSelectedRow(row: Int) {
//        let defaults = NSUserDefaults.standardUserDefaults() //user defaults work with key value pairs, like the dictionary we saw in space adventure.
//        defaults.setInteger(row, forKey: userDefaultsLastRowKey)
//        defaults.synchronize() //saves data to the p-list file
//    }

}

