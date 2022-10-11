//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Zaggle on 10/10/22.
//

import Foundation

struct WeatherData:Codable{
    let name:String
    let main:Main
    let weather:[Weather]
    
    
    
}

struct Main:Codable{
    let temp:Double
}

struct Weather:Codable{
    let id:Int
    let description:String
}
