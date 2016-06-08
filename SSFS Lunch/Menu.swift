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
    var differentMenu = [String]()
    var spacesMenu = [String]()
    var aMenu = String()
    
    init() {
//        let path = NSBundle.mainBundle().pathForResource("document", ofType: "xml")
//        
//        do {
//            self.menuContents = try String(contentsOfFile: path!) //exclamation point so that it doesn't return nil
//        }
//        catch {
//            print("There was an error.")
//        }
        
        if let url = NSURL(string: "https://grover.ssfs.org/menus/word/document.xml") {
            
            do {
                self.menuContents = try String(contentsOfURL: url, usedEncoding: nil)
            } catch {
                print("there was an error.")
            }
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
        for item in otherMenu {
            if item.containsString("&amp;") {
                let newString = item.stringByReplacingOccurrencesOfString("&amp;", withString: "&")
                differentMenu.append(newString)
            }
            else {
                differentMenu.append(item)
            }
        }
        var number = Int()
        var loop = -1
        var n = 0
        for item in differentMenu {
            spacesMenu.append(item)
        }
        
        for item in differentMenu {
            loop += 1
            if item == "SIDES" {
                //okay, so I know that this messes up when cous cous is a side dish, because it's in the array as "cous" and then a separate, secondary "cous", but I'd rather have it look a little weird the few times a year that they have cous cous or any other side dish that is separated in the array and have it print out "cous & cous", and have everything else look nice, than to have every day of the year look weird and bunched together, and because I just spent a lot of time trying to figure out how to get it to print out an ampersand in between sides and souper soups, I am surprisingly adamant about this issue.
                number = loop + 2 + n
                spacesMenu.insert(" & ", atIndex: number)
                n += 1
            } else if item == "SOUPER SOUPS" {
                number = loop + 2 + n
                spacesMenu.insert(" & ", atIndex: number)
                n += 1
            }
        }
        for item in spacesMenu {
            let newString = String(item)
            aMenu = aMenu + newString
        }
    }
    
        func rangeFromNSRange(nsRange: NSRange, forString str: String) -> Range<String.Index>? {
            let fromUTF16 = str.utf16.startIndex.advancedBy(nsRange.location, limit: str.utf16.endIndex)
            let toUTF16 = fromUTF16.advancedBy(nsRange.length, limit: str.utf16.endIndex)
            
            if let from = String.Index(fromUTF16, within: str),
            let to = String.Index(toUTF16, within: str) {
                return from ..< to
            }
            return nil
        }
        
    func getLunch(stringToParse: String, regExText: String) -> String {
        var name: String = ""
            do {
                let regex = try NSRegularExpression(pattern: regExText, options: NSRegularExpressionOptions.CaseInsensitive)
                let matches = regex.matchesInString(stringToParse as String, options: [], range: NSMakeRange(0, stringToParse.characters.count))
                if let match = matches.first {
                    let range = match.rangeAtIndex(1)
                    if let swiftRange = rangeFromNSRange(range, forString: stringToParse as String) {
                        name = stringToParse.substringWithRange(swiftRange)
                    }
                }
            } catch {
                //regex was bad!
            }
        return name
        }
    
}

