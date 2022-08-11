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
    
    let priceManager = PriceManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
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
        
        return priceManager.currencyArray.count
        
    }
}

// MARK: - UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    
    /// Return the string to display in each row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return priceManager.currencyArray[row]
        
    }
    
    /// Call getCoinPrice with the selected row's currency
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        priceManager.getCoinPrice(for: priceManager.currencyArray[row])
        
    }
    
}
