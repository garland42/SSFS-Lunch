//
//  Menu.swift
//  SSFS Lunch
//
//  Created by Claire Youmans on 4/25/16.
//  Copyright © 2016 Claire Youmans. All rights reserved.
//

import Foundation
class Menu {
    var menuContents = String()
    
    var shorterMenu = [String]()
    var otherMenu = [String]()
    var aMenu = NSMutableString()
    
    init() {
        //self.menuContents = something
        //NSBundle, mainBundle
        let path = NSBundle.mainBundle().pathForResource("document", ofType: "xml")
        
        do {
            self.menuContents = try String(contentsOfFile: path!) //exclamation point so that it doesn't return nil
        }
        catch {
            print("There was an error.")
        }
        
        let newMenu = self.menuContents.componentsSeparatedByString(">")
        for item in newMenu {
            if item.containsString("</w:t") && !item.containsString("</w:tc") && !item.containsString("</w:tr") && !item.containsString("</w:tbl"){
                shorterMenu.append(item)
            }
        }
        for item in shorterMenu {
            if item.containsString("</w:t") {
                let newString = item.stringByReplacingOccurrencesOfString("</w:t", withString: "")
                otherMenu.append(newString)
            }
            else {
                otherMenu.append(item)
            }
        }
        //print(otherMenu)
        for item in otherMenu {
            let newString = String(item)
            aMenu.appendString(newString)
        }
        print(aMenu)
    }
    
    
    
}

