//
//  DailyMenu.swift
//  SSFS Lunch
//
//  Created by Claire Youmans on 5/17/16.
//  Copyright © 2016 Claire Youmans. All rights reserved.
//

import Foundation
class DailyMenu {
//    var lunchEntree = String()
//    var vegetarianEntree = String()
//    var sides = String()
//    var souperSoups = String()
//    var downtownDeli = String()
//    var dayMeal: String
    
    var menu = Menu()

    init() { //init(regExText: String) {
        
//        self.dayMeal = String(menu.getLunch(menu.aMenu, regExText: regExText))
//        lunchEntree = String(menu.getLunch(dayMeal, regExText: "LUNCH ENTRÉE(.*?)VEGETARIAN"))
//        print(lunchEntree)
//        getDailyMeal()
        let lunchEntree = String(menu.getLunch(menu.aMenu, regExText: "MONDAY(.*?)TUESDAY"))
        print(lunchEntree)

    }
    
//    func getDailyMeal() {
//        lunchEntree = String(menu.getLunch(dayMeal, regExText: "LUNCH ENTRÉE(.*?)VEGETARIAN"))
//        vegetarianEntree = String(menu.getLunch(dayMeal, regExText: "VEGETARIAN ENTRÉE(.*?)SIDES"))
//        sides = String(menu.getLunch(dayMeal, regExText: "SIDES(.*?)SOUPER SOUPS"))
//        souperSoups = String(menu.getLunch(dayMeal, regExText: "SOUPER SOUPS(.*?)DOWNTOWN"))
//        downtownDeli = String(menu.getLunch(dayMeal, regExText: "DOWNTOWN DELI(.*?)DINNER"))
//    }
}