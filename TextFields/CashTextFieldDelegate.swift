//
//  CashTextFieldDelegate.swift
//  TextFields
//
//  Created by Youngsun Paik on 3/17/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var newText: NSString = textField.text!
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        let newTextString = String(newText)
        
        let digit = NSCharacterSet.decimalDigitCharacterSet()
        var digitText = ""
        
        for c in newTextString.unicodeScalars { // character in newTextString
            if digit.longCharacterIsMember(c.value) { // if character (long character) is a member of digit xxxxx (receiver)
                digitText.append(c)
            }
        }
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: "en-US")
        
        let numberInDoubleWithTwoDecimalPoints = (NSString(string: digitText).doubleValue)/100
        
        textField.text = formatter.stringFromNumber(numberInDoubleWithTwoDecimalPoints)
        
        
        
        
        return false
    }
    
    
}
