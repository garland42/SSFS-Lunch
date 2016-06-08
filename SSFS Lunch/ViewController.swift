//
//  ViewController.swift
//  SSFS Lunch
//
//  Created by Claire Youmans on 4/25/16.
//  Copyright © 2016 Claire Youmans. All rights reserved.
//

//Should I make it so that if the lunch isn't up on the website, it says "lunch unavailable currently" or something?

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
    let friday = DailyMenu(regExText: "FRIDAY(.*)", isFriday: true) //"is Friday: true" necessary because there is a separate set of code needed for Friday due to the fact that every other weekday is mentioned only once but Friday is mentioned twice. This is also the reason that it says "FRIDAY(.*)" and NOT "FRIDAY(.*?)SATURDAY". Actually, I could probably put "FRIDAY(.*)SATURDAY", but it already works, so who cares?
    
    
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
        
        var dayString = String()
        var dayBool = Bool()
        if weekdays[row] == "Monday" {
            dayString = "MONDAY(.*?)TUESDAY"
            dayBool = false
        } else if weekdays[row] == "Tuesday" {
            dayString = "TUESDAY(.*?)WEDNESDAY"
            dayBool = false
        } else if weekdays[row] == "Wednesday" {
            dayString = "WEDNESDAY(.*?)THURSDAY"
            dayBool = false
        } else if weekdays[row] == "Thursday" {
            dayString = "THURSDAY(.*?)FRIDAY"
            dayBool = false
        } else if weekdays[row] == "Friday" {
            dayString = "FRIDAY(.*)"
            dayBool = true
        }
        
        let day = DailyMenu(regExText: dayString, isFriday: dayBool)
        
        lunchEntreeLabel.text = "Lunch Entrée: " + day.lunchEntree
        vegetarianEntreeLabel.text = "Vegetarian Entrée: " + day.vegetarianEntree
        sidesLabel.text = "Sides: " + day.sides
        souperSoupsLabel.text = "Souper Soups: " + day.souperSoups
        downtownDeliLabel.text = "Downtown Deli: " + day.downtownDeli
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weekLabel.text = week.dayMeal
        self.dayPicker.delegate = self
        self.dayPicker.dataSource = self
        let date = String(NSDate())
        let index = date.startIndex.advancedBy(10) //10 because yyyy-MM-dd is 10 characters long
        let justDate = date.substringToIndex(index) //I only want the date, not the time
        let number = String(getDayOfWeek(justDate)) //put as string bc otherwise error? boolean or something??
        var rowNumber = Int()
        if number == "Optional(1)" { //if it's sunday
            rowNumber = 0 //then it shows monday
        } else if number == "Optional(2)" { //if it's monday
            rowNumber = 0 //then it shows monday
        } else if number == "Optional(3)" { //etc for tuesday, etc for rest
            rowNumber = 1
        } else if number == "Optional(4)" {
            rowNumber = 2
        } else if number == "Optional(5)" {
            rowNumber = 3
        } else if number == "Optional(6)" {
            rowNumber = 4
        } else if number == "Optional(7)" { //if it's saturday
            rowNumber = 0 //then it also shows monday
        } else { //if for some reason it doesn't have the day
            rowNumber = 2 //then it shows wednesday by default (middle of pickerview)
        }
        dayPicker.selectRow(rowNumber, inComponent: 0, animated: false) //daypicker automatically is on the current date
        pickerView(dayPicker, didSelectRow: rowNumber, inComponent: 0) //label automatically shows lunch for current date
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getDayOfWeek(today:String)->Int? { //code that I found that takes any date in the form of yyyy-MM-dd (as "today") and spits out what day of the week it is, with "Optional(1)" being Sunday, "Optional(2)" being Monday, etc, all the way up to "Optional(7) being Saturday.
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd" //the format that NSFormatter should take/accept is yyyy-MM-dd
        if let todayDate = formatter.dateFromString(today) {
            let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)! //We use the Gregorian Calendar. I was looking it up, and apparently as each country switched over to the Gregorian country at different times/years/whatever, they had to skip over a certain number of days. For instance, I think that the US had to skip like 10 days in October or something, which is pretty cool.
            let myComponents = myCalendar.components(.Weekday, fromDate: todayDate)
            let weekDay = myComponents.weekday
            return weekDay
        } else {
            return nil
        }
    }

}

