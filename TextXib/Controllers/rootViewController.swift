//
//  rootViewController.swift
//  TextXib
//
//  Created by Zaggle on 22/09/22.
//

import UIKit
import CoreLocation


class rootViewController: UIViewController, UITextFieldDelegate,WeatherManegerDelegate {
    @IBOutlet weak var tempField: UILabel!
    
 
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var citySearchTextField: UITextField!
    var weatherManeger = WeatherManeger()
    let locationManeger =  CLLocationManager()
    
    var lat:String = ""
    var lon:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
       
        
        //use startupdating location for mutple time updation og location
        locationManeger.delegate = self
        //Will ask the user for permission
        locationManeger.requestWhenInUseAuthorization()
        locationManeger.requestLocation()
        weatherManeger.delegate = self
        citySearchTextField.delegate = self
        
    }

    @IBAction func currentWeather(_ sender: UIButton) {
        weatherManeger.fetchWeather(lon: lon,lat: lat)
        
    }
    @IBAction func searchButton(_ sender: Any) {
        citySearchTextField.endEditing(true)
        print(citySearchTextField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(citySearchTextField.text!)
        citySearchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if citySearchTextField.text != "" {
            return true
        }else{
            citySearchTextField.placeholder = "Type Something"
            return false

        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = citySearchTextField.text{
            weatherManeger.fetchWeather(city: city)
        }
        citySearchTextField.text = ""

    }
    
    func didUpdateWeather(_ weatherManeger:WeatherManeger,weather:WeatherModel){
        
        DispatchQueue.main.async {
            self.tempField.text = weather.tempString
            self.weatherImage.image = UIImage(systemName: weather.conditonName)
            self.cityName.text = weather.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

extension rootViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
             lat = String(location.coordinate.latitude)
             lon = String(location.coordinate.longitude)
            
        };
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
