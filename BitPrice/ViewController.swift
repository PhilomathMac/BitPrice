//
//  ViewController.swift
//  BitPrice
//
//  Created by McKenzie Macdonald on 8/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var unitLabel: UILabel!
    @IBOutlet var currencyPicker: UIPickerView!
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
    }
    
    func getCoinPrice(for currency: String) {
        
    }


}
// MARK: - UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    
    /// Returns the number of columns in the picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /// Returns the number of rows in the picker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return currencyArray.count
        
    }
}

// MARK: - UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    
    /// Return the string to display in each row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return currencyArray[row]
        
    }
    
    /// Call getCoinPrice with the selected row's currency
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        getCoinPrice(for: currencyArray[row])
        
    }
    
}
