//
//  ViewController.swift
//  wheatherApp
//
//  Created by karwan Syborg on 10/08/2025.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var SearchField: UITextField!
    @IBOutlet weak var whatherIcon: UIImageView!
    @IBOutlet weak var whetherTempreture: UILabel!
    @IBOutlet weak var whetherCity: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SearchField.delegate = self
    }

    
    
    @IBAction func SearchButton(_ sender: UIButton) {
//        print(SearchField.text!)
        whetherCity.text = SearchField.text
        SearchField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        SearchField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        whetherCity.text = textField.text
        textField.text = ""
        textField.resignFirstResponder()
    }
    
}

