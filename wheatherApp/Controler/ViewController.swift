//
//  ViewController.swift
//  wheatherApp
//
//  Created by karwan Syborg on 10/08/2025.
//
// api key : a89bad3a6d3f947a4faaad85523560da

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var SearchField: UITextField!
    @IBOutlet weak var whatherIcon: UIImageView!
    @IBOutlet weak var whetherTempreture: UILabel!
    @IBOutlet weak var whetherCity: UILabel!
    @IBOutlet weak var weatherDescreption: UILabel!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SearchField.delegate = self
        weatherManager.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }

}

//MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate{
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

//MARK: - WeatherManagerDelegate

extension ViewController: WeatherManagerDelegate{
   
   func didUpdateWeather(_ weather: WeatherModel) {
        DispatchQueue.main.async {
            self.whetherTempreture.text = "\(weather.temperatureString)°C"
            self.whetherCity.text = weather.cityName
            self.whatherIcon.image = UIImage(systemName: weather.conditionName)
            self.weatherDescreption.text = weather.description
        }
    }
   
    //test test test test 
    // func test(weather: WeatherModel) {
    //     DispatchQueue.main.async {
    //         print(weather.temperatureString , weather.cityName)
    //     }
    // }   

}

