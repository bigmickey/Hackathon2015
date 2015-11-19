//
//  SecondViewController.swift
//  ING Cash
//
//  Created by Paul Keller on 14/11/2015.
//  Copyright © 2015 Planet K Games. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var amtPicker: UIPickerView!
    @IBOutlet var cashCode: UILabel!
    @IBOutlet var validityTicker: UILabel!
    @IBOutlet var yourATMCodeLabel: UILabel!
    @IBOutlet var atmCode: UILabel!
    @IBOutlet var generateATMCodeButton: UIButton!
    @IBOutlet var sendToContactButton: UIButton!
    @IBOutlet var startAgainButton: UIButton!
    
    @IBAction func generateCashCode(sender: AnyObject) {
        cashCode.hidden = false
        validityTicker.hidden = false
        generateATMCodeButton.hidden = false
        
        var code: String!
        code = String(GenerateRandomNumber(8))
        while code.characters.count < 8 {
            code = String(GenerateRandomNumber(8))
        }
        
        cashCode.text = code
        
    }
    
    @IBAction func generateATMCode(sender: AnyObject) {
        yourATMCodeLabel.hidden = false
        atmCode.hidden = false
        sendToContactButton.hidden = false
        startAgainButton.hidden = false
        
        var code: String!
        code = String(GenerateRandomNumber(4))
        while code.characters.count < 4 {
            code = String(GenerateRandomNumber(4))
        }
        
        atmCode.text = code
    }
    
    @IBAction func SendToContact(sender: AnyObject) {
        //Open Contacts List and select a contact
    }
    
    @IBAction func startAgain(sender: AnyObject) {
        //Enable amount picker
        cashCode.hidden = true
        validityTicker.hidden = true
        generateATMCodeButton.hidden = true
        yourATMCodeLabel.hidden = true
        atmCode.hidden = true
        sendToContactButton.hidden = true
        startAgainButton.hidden = true
    }
    
    var pickerData: [String] = [String]()
    var currencySymbol: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Connect data:
        self.amtPicker.delegate = self
        self.amtPicker.dataSource = self
        
        //Get the local currency, from a table somewhere?
        //Geo locate the location, obtain country and set currency symbol
        //Potential problem. Denominations. 10 Rupiah is about 1/4 or a penny
        
        // Input data into the Array:
        pickerData = ["10", "20", "30", "40", "50", "60", "70", "80", "90", "100",
                        "120", "140", "160", "180", "200", "250", "300", "350", "400",
                        "450", "500"]
        
        //Set the currency
        GetCurrencySymbol()
        
        self.amtPicker.selectRow(4, inComponent: 0, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func GetCurrencySymbol(){
        
        currencySymbol = "$"

    }


    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencySymbol + pickerData[row]
    }
    
    func GenerateRandomNumber(digitCount: Int) -> UInt32 {
        
        var upperBounds: UInt32!
        
        switch digitCount {
        case 8:
            upperBounds = 99999999
            break
        case 4:
            upperBounds = 9999
            break
        default:
            break
        }
        
        return arc4random_uniform(upperBounds)
        
    }
    
}

