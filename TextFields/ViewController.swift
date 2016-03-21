//
//  ViewController.swift
//  TextFields
//
//  Created by Jason on 11/11/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // Outlets
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var characterCountLabel: UILabel!
    @IBOutlet weak var totalCountLabel: UILabel!
    @IBOutlet weak var editSwitch: UISwitch!
    
    // Text Field Delegate objects
    let emojiDelegate = EmojiTextFieldDelegate()
    let colorizerDelegate = ColorizerTextFieldDelegate()
    let randomColorDelete = RandomColorTextFieldDelegate()
    let cashDelegate = CashTextFieldDelegate()
    let zipDelegate = ZipTextFieldDelegate()

    
    // Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // set the label to be hidden
        self.characterCountLabel.hidden = true
        
        // Set the three delegates
        self.textField1.delegate = zipDelegate
        self.textField2.delegate = cashDelegate
        self.textField3.delegate = self
    }

    
    // Text Field Delegate Methods
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        return editSwitch.on
        
        
//        // Figure out what the new text will be, if we return true
//        var newText: NSString = textField.text!
//        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
//        
//        // hide the label if the newText will be an empty string
//        self.characterCountLabel.hidden = (newText.length == 0)
//        
//        // Write the length of newText into the label
//        self.characterCountLabel.text = String(newText.length)
//        
//        // returning true gives the text field permission to change its text
//        return true;
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        print("TextField did begin editing method called")
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        print("TextField did end editing method called")
        
        var firstTextField: NSString = textField1.text!
        var secondTextField: NSString = textField2.text!
        var thirdTextField: NSString = textField3.text!
        
        self.totalCountLabel.hidden = (firstTextField.length == 0 && secondTextField.length == 0 && thirdTextField.length == 0)
        
        var totalCount: Int = firstTextField.length + secondTextField.length + thirdTextField.length
        print(totalCount)
        
        self.totalCountLabel.text = String(totalCount)
        
        
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        print("TextField should begin editing method called")
        return true
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        print("TextField should clear method called")
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("Return key in the keyboard is present")
        return true
    }
    

    


}

