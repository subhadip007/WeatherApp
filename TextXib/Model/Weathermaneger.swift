//
//  Weathermaneger.swift
//  WeatherApp
//
//  Created by Zaggle on 29/09/22.
//

import Foundation
protocol WeatherManegerDelegate{
    func didUpdateWeather(_ weatherManeger:WeatherManeger,weather:WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManeger{
    let apiEndpoint = "https://api.openweathermap.org/data/2.5/weather?appid=8a5c7dff724ac118f04b1abd62a56cbc&units=metric"
    
    
    var delegate:WeatherManegerDelegate?
    
    func fetchWeather(city: String="",lon: String = "",lat:String = ""){
        var urlString = ""
        if(!city.isEmpty){
         urlString = "\(apiEndpoint)&q=\(city)"
            
        }else{
            urlString = "\(apiEndpoint)&lat=\(lat)&lon=\(lon)"
        }
        performRequest(urlString: urlString )
            
        
    }
    
    func performRequest(urlString:String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data{
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(self,weather: weather)
                    }
                }
            }
            task.resume()
        }
        
            
    }
    func parseJSON(_ weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        
        do{
        
        //here the WeatherData.self refers to the data type not an object you use .self method
        let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
//            print(weather.conditonName)
//            print(weather.tempString)
            return weather
        }catch{
            print(error)
            return nil
        }
    }
    
    
    
    
}
