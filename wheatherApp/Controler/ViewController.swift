//
//  ViewController.swift
//  wheatherApp
//
//  Created by karwan Syborg on 10/08/2025.
//
// api key : a89bad3a6d3f947a4faaad85523560da

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var SearchField: UITextField!
    @IBOutlet weak var whatherIcon: UIImageView!
    @IBOutlet weak var whetherTempreture: UILabel!
    @IBOutlet weak var whetherCity: UILabel!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SearchField.delegate = self
    }

    
    
    @IBAction func SearchButton(_ sender: UIButton) {
//        print(SearchField.text!)
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

        if let city = SearchField.text {
            weatherManager.fetchWheather(city)
        }  
        textField.text = ""
        textField.resignFirstResponder()
    }
    
}

