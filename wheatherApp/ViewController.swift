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
        SearchField.text = ""
        SearchField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        whetherCity.text = SearchField.text
        textField.resignFirstResponder()
        SearchField.endEditing(true)
        SearchField.text = ""
        return true
    }
    
    
    
    
}

